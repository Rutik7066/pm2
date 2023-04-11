// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'package:async/async.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/src/media_type.dart';
import 'package:image/image.dart' as Im;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_compression_flutter/image_compression_flutter.dart';
import 'package:pm/Authentication/user.dart';
import 'package:pm/const.dart';
import 'package:pm/db/folder_repo.dart';
import 'package:pm/model/customer_modal.dart';
import 'package:pm/page/dashboard/whatsapp_message.dart';
import 'package:pm/pb.dart';
import 'package:pm/util/whatsapp.dart';
import 'package:pocketbase/pocketbase.dart';

class CreateFolderProvider extends ChangeNotifier {
  int uploadFlag = 10;
  //
  List<PlatformFile> images = [];
  int qtyCompleted = 0;
  //
  int uploadProgress = 0;
  int uploadTotal = 0;
//
  List<Map<String, dynamic>> compressingFile = [];
  String? customer;

  ///
  String? error;
  String title = 'title';
  //

  void selectCust(String cu) {
    customer = cu;
    notifyListeners();
  }

  String getDir() {
    String path = images.first.path!;
    List<String> pathList = path.split('\\');
    pathList.removeLast();
    path = pathList.first;
    for (String element in pathList) {
      if (element != pathList.first) {
        path = path + "\\" + element;
        print(path);
      }
    }
    return path;
  }

  void addImages(List<PlatformFile> images) {
    this.images.addAll(images);
    int i = 0;
    for (var image in images) {
      compressingFile.add({
        'index': i++,
        "name": image.name,
        'status': '',
      });
    }
    notifyListeners();
  }

  void removeImage(int index) {
    images.removeAt(index);
    notifyListeners();
  }

  Future createIsolate(List<PlatformFile> images) async {
    // Creating Main Isolate's Receive Port
    ReceivePort mainreceivePort = ReceivePort();
    // Spawning Child Isolate
    Isolate.spawn(isolateFunc, mainreceivePort.sendPort);
    // Getting Child Isoltae Send Port
    final childEvent = StreamQueue<dynamic>(mainreceivePort);
    SendPort childSendPort = await childEvent.next;

    // Looping
    for (var images in images) {
      // Sending Path to Compress
      childSendPort.send(images.path);
      // Waiting for response
      var i = await childEvent.next;
      // Printing Response
      print(i);
    }
    // Ending Isolate
    childSendPort.send(null);
  }

  static String getFileSizeString({required int byts, int decimals = 0}) {
    const suffixes = ["b", "kb", "mb", "gb", "tb"];
    var i = (log(byts) / log(1024)).floor();
    return ((byts / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }

  static void isolateFunc(SendPort mainSendPort) async {
    // Creating own Recieve Port
    ReceivePort childReceivePort = ReceivePort();
    // Sending own Recieve Port to Main Isolate
    mainSendPort.send(childReceivePort.sendPort);
    // Checking for message to come from main Isolate
    await for (var path in childReceivePort) {
      if (path is String) {
        print('Received Path => $path');
        File imageFile = File(path);
        print("1");
        final ib = imageFile.readAsBytesSync();
        print("2");

        Im.Image? image = Im.decodeImage(ib);
        print("3");

        if (image != null) {
          var rimage = Im.copyResize(image, width: 1000);
          var bytes = Im.encodeJpg(
            rimage,
            quality: 100,
          );

          dev.log(getFileSizeString(byts: bytes.length));
          // Compress Done Sending bytes to main Isolate
          mainSendPort.send(bytes);
        }
        print("4");
      } else {
        break;
      }
    }
    print('Spawned isolate finished.');
    Isolate.exit();
  }

  Future<String?> uploadMultipart() async {
// example create body

    final body = <String, dynamic>{
      "user": User.fromBox().id.toString(),
      'title': title,
      "length": images.length,
      "status": 0,
      "images": [],
    };

    ReceivePort mainreceivePort = ReceivePort();
    // Spawning Child Isolate
    Isolate.spawn(isolateFunc, mainreceivePort.sendPort);
    // Getting Child Isoltae Send Port
    final childEvent = StreamQueue<dynamic>(mainreceivePort);
    SendPort childSendPort = await childEvent.next;
    uploadFlag = 0;
    notifyListeners();

    for (var image in images) {
      dev.log("Sending Path to Compress");
      childSendPort.send(image.path);
      dev.log(" Waiting for response");
      var i = await childEvent.next;

      dev.log("Uploading image");
      final img = await pb.collection('images').create(body: {
        "localurl": image.path,
        "isSelected": true,
      }, files: [
        http.MultipartFile.fromBytes('image', i, filename: image.name)
      ]);
      dev.log("Uploaded");
      body['images'].add(img.id);
      compressingFile[qtyCompleted]['status'] = "Compresed";
      print(compressingFile[qtyCompleted]);
      qtyCompleted++;
      print(qtyCompleted);
      notifyListeners();
    }

    childSendPort.send(null);
    uploadFlag = 1;
    notifyListeners();
    try {
      final record = await pb.collection('folder').create(body: body);
      uploadFlag = 0;
      notifyListeners();

      qtyCompleted = 0;
      uploadFlag = 2;

      notifyListeners();
      print(title);
      String link = "https://www.photographymanager.in/photogallery?id=${record.id}";
      if (customer != null) {
        await Whatsapp().createMessage(
          number: customer!,
          message: "Click on this for selection $link",
        );
      }
      images = [];
      compressingFile = [];
      customer = null;
      return link;
    } on ClientException catch (e) {
      dev.log(e.response["data"].toString());
      dev.log(e.response.toString());
      error = "Failed To Upload";
      notifyListeners();
      return null;
    }
  }

  clearAllWith() {
    images = [];
    qtyCompleted = 0;
    uploadFlag = 1;
    error = null; //d 7219656111
    notifyListeners();
  }

  clearAll() {
    images = [];
    qtyCompleted = 0;
    uploadFlag = 1;
    error = null;
  }

  String formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i];
  }
}
