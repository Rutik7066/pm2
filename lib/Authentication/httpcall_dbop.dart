import 'package:hive/hive.dart';
import 'package:pm/Authentication/user.dart';
import 'package:pm/db/db.dart';
import 'package:pm/model/job_image_modal.dart';
import 'package:pm/model/job_modal.dart';

class HttpCallDbop {
  JobImageModal folderImageFromMap({required Map<String, dynamic> image, required JobModal folder}) {
    return JobImageModal()
      ..awsKey = image['key']
      ..backendId = image['id']
      ..backendfolderid = image['JobID']
      ..isSelected = image['is_selected']
      ..localurl = image['local_url']
      ..name = image['name']
      ..url = image['bucket_url'];
  }

  JobModal folderFromMap(Map<String, dynamic> folder) {
    return JobModal()
      ..awsId = folder["aws_id"]
      ..backendId = folder["id"]
      ..length = folder["length"]
      ..status = folder["status"]
      ..userId = folder["CustomerID"];
  }

  Future<void> createAccountDbOp(Map<String, dynamic> customer) async {
    var box = Hive.box("dll12");
    customer.remove('jobs');
    return await box.putAll(customer);
  }

  Future<void> loginDbOp(Map<String, dynamic> customer) async {
    var folders = customer['jobs'];
    final isar = await openDb();
    await isar.writeTxn(() async {
      // itterate over the list of map of folder.
      for (var folderMap in folders) {
        // construct folder object from map single folder.
        JobModal folder = folderFromMap(folderMap);
        List<JobImageModal> images = [];
        // Getting list of map  of image  from main map.
        var imageList = folderMap['images'];
        // itterating over list of map of images.
        for (var image in imageList) {
          // construct image from map of single and assign the folder value and adding to the list of image object.
          images.add(folderImageFromMap(image: image, folder: folder));
        }
        // putting all image object to db.
        await isar.jobImageModals.putAll(images);
        // assigning list of image object to folder.
        folder.images.addAll(images);
        // putting folder to db.
        await isar.jobModals.put(folder);
        // saving folder withb image object.
        await folder.images.save();
      }
    });
    customer.remove('jobs');
    await addUser(customer);
  }

  Future<bool> getCustomer(Map<String, dynamic> map) async {
    // Update Creadit
    await Hive.box('dll12').put("credit", map['credit']);
    // Update Validity
    await Hive.box('dll12').put("valid_till", map['valid_till']);
    // Then clear all db
    final isar = await openDb();

    await isar.writeTxn(() async {
      await isar.jobImageModals.clear();
      await isar.jobModals.clear();
      // Then add every thing
      var folders = map['jobs'];
      // itterate over the list of map of folder.
      for (var folderMap in folders) {
        // construct folder object from map single folder.
        JobModal folder = folderFromMap(folderMap);
        List<JobImageModal> images = [];
        // Getting list of map  of image  from main map.
        var imageList = folderMap['images'];
        // itterating over list of map of images.
        for (var image in imageList) {
          // construct image from map of single and assign the folder value and adding to the list of image object.
          images.add(folderImageFromMap(image: image, folder: folder));
        }
        // putting all image object to db.
        await isar.jobImageModals.putAll(images);
        // assigning list of image object to folder.
        folder.images.addAll(images);
        // putting folder to db.
        await isar.jobModals.put(folder);
        // saving folder withb image object.
        await folder.images.save();
      }
    });
    return true;
  }
}
