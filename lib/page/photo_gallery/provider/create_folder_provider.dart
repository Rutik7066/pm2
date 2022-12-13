// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'dart:convert';
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
import 'package:pm/util/whatsapp.dart';

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
  CustomerModal? customer;

  ///
  String? error;
  String title = 'title ${DateTime.now().microsecond}';
  //

  void selectCust(CustomerModal cu) {
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
        Im.Image? image = Im.decodeImage(imageFile.readAsBytesSync());
        if (image != null) {
          var bytes = Im.encodeJpg(image, quality: 30);
          // Compress Done Sending bytes to main Isolate
          mainSendPort.send(bytes);
        }
      } else {
        break;
      }
    }
    print('Spawned isolate finished.');
    Isolate.exit();
  }

  Future<String?> uploadMultipart() async {
    var url = '$host/createfolder';
    String dir = getDir();
    var form = dio.FormData();
    form.fields.add(MapEntry('uid', User.fromBox().uid.toString()));
    form.fields.add(MapEntry('title', title));
    form.fields.add(MapEntry('dir', dir));
    // Creating Main Isolate's Receive Port
    ReceivePort mainreceivePort = ReceivePort();
    // Spawning Child Isolate
    Isolate.spawn(isolateFunc, mainreceivePort.sendPort);
    // Getting Child Isoltae Send Port
    final childEvent = StreamQueue<dynamic>(mainreceivePort);
    SendPort childSendPort = await childEvent.next;
    uploadFlag = 0;
    notifyListeners();
    // Looping
    for (var image in images) {
      // Sending Path to Compress
      childSendPort.send(image.path);
      // Waiting for response
      var i = await childEvent.next;
      // Printing Response
      form.files.add(
        MapEntry(
          image.name,
          dio.MultipartFile.fromBytes(
            i,
            filename: image.name,
            contentType: MediaType('image', 'jpg'),
          ),
        ),
      );
      print('Form File Length => ${form.files.length}');
      compressingFile[qtyCompleted]['status'] = "Compressed";

      qtyCompleted++;
      notifyListeners();
    }
    // Ending Isolate
    childSendPort.send(null);
    uploadFlag = 1;
    notifyListeners();
    var dioobj = dio.Dio();

    try {
      var res = await dioobj.post(
        url,
        data: form,
        options: dio.Options(contentType: 'multipart/form-data'),
        onSendProgress: (count, total) {
          uploadTotal = total / 1024 ~/ 1024;
          uploadProgress = count / 1024 ~/ 1024;
          notifyListeners();
          print("${formatBytes(count, 0)}/${formatBytes(total, 0)}");
        },
      );
      dioobj.close();

      var data = res.data;
      print(data);
      uploadFlag = 0;
      notifyListeners();

      if (res.statusCode == 200) {
        FolderRepo().addFolderFromMap(data['folder'], customer!);
        qtyCompleted = 0;
        uploadFlag = 2;
        Hive.box('dll12').put('credit ', data['credit']);
        notifyListeners();
        print(title);
        String  link = "https://photographymanager.in/photogallery?uid=${User.fromBox().uid}&folder=$title";
        await Whatsapp().createMessage(number: customer!.number, message: 
        link,);
        return link;
      } else if (res.statusCode == 401) {
        error = "Insufficient Credit";
      } else {
        error = "Failed To Upload";
      }
    } on dio.DioError catch (e) {
      error = e.toString();
      notifyListeners();
    }
    return null;
  }

  clearAllWith() {
    images = [];
    qtyCompleted = 0;
    uploadFlag = 1;
    error = null;
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
