import 'dart:convert';

import 'package:http/http.dart';
import 'package:pm/Authentication/httpcall_dbop.dart';
import 'package:pm/Authentication/user.dart';
import 'package:pm/const.dart';
import 'package:pm/db/db.dart';
import 'package:isar/isar.dart';
import 'package:pm/model/job_image_modal.dart';
import 'package:pm/model/job_modal.dart';
import 'package:pm/model/customer_modal.dart';

class FolderRepo {
  Future<void> addFolderFromMap(Map<String, dynamic> folderMap, CustomerModal customer) async {
    final isar = await openDb();
    await isar.writeTxn(() async {
      JobModal folder = JobModal()
        ..awsId = folderMap["aws_id"]
        ..backendId = folderMap["id"]
        ..length = folderMap["length"]
        ..status = folderMap["status"]
        ..cust.value = customer
        ..userId = folderMap["CustomerID"];
      List<JobImageModal> images = [];
      print(folderMap);
      for (var image in folderMap['images']) {
        JobImageModal img = JobImageModal()
          ..awsKey = image['key']
          ..backendId = image['id']
          ..backendfolderid = image['JobID']
          ..isSelected = image['is_selected']
          ..localurl = image['local_url']
          ..name = image['name']
          ..url = image['bucket_url'];
        images.add(img);
      }
      await isar.jobImageModals.putAll(images);
      await isar.jobModals.put(folder);
      folder.images.addAll(images);
      await folder.images.save();
    });
  }

  Future<void> addImagesFromMap({required JobModal folder, required Map<String, dynamic> imagesMap}) async {
    final isar = await openDb();
    List<JobImageModal> images = [];
    for (var image in imagesMap['images']) {
      JobImageModal img = JobImageModal()
        ..awsKey = image['key']
        ..backendId = image['id']
        ..backendfolderid = image['JobID']
        ..isSelected = image['is_selected']
        ..localurl = image['local_url']
        ..name = image['name']
        ..url = image['bucket_url'];
      images.add(img);
    }
    folder.images.addAll(images);
    await isar.writeTxn(() async {
      await isar.jobImageModals.putAll(images);
      await folder.images.save();
    });
  }

  Future<void> addImagesFromList({required JobModal folder, required, required List imagesMap}) async {
    final isar = await openDb();
    List<JobImageModal> images = [];
    for (var image in imagesMap) {
      JobImageModal img = JobImageModal()
        ..awsKey = image['key']
        ..backendId = image['id']
        ..backendfolderid = image['JobID']
        ..isSelected = image['is_selected']
        ..localurl = image['local_url']
        ..name = image['name']
        ..url = image['bucket_url'];
      images.add(img);
    }
    folder.images.addAll(images);
    await isar.writeTxn(() async {
      await isar.jobImageModals.putAll(images);
      await folder.images.save();
    });
  }

  Future<void> deleteFolder(int folderId) async {
    final isar = await openDb();
    await isar.writeTxn(() async => isar.jobModals.delete(folderId));
  }

  Future<void> deleteImage(int imageId) async {
    final isar = await openDb();
    await isar.writeTxn(() async => isar.jobImageModals.delete(imageId));
  }

  Stream<List<JobModal>> listenToFolder() async* {
    try {
      Uri url = Uri.parse('$host/getcustomer');
      var re = await post(url, headers: {'content-type': 'application/json'}, body: jsonEncode({"uid": User.fromBox().uid}));
      if (re.statusCode == 200) {
        print(re.statusCode);
        await HttpCallDbop().getCustomer(jsonDecode(re.body));
      } else {
        print(re.reasonPhrase);
      }
    } catch (e) {
      print("helloo");
      print(e);
    }
    final isar = await openDb();
    yield* isar.jobModals.where().watch(fireImmediately: true);
  }

  Stream<JobModal?> getFolderById(int id) async* {
    final isar = await openDb();
    yield* isar.jobModals.watchObject(id, fireImmediately: true);
  }
}
