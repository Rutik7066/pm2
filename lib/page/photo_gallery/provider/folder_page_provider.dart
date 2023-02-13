import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:image_compression_flutter/image_compression_flutter.dart';
import 'package:pm/const.dart';
import 'package:pm/db/folder_repo.dart';
import 'package:pm/model/folder_image.dart';
import 'package:pm/model/job_image_modal.dart';
import 'package:pm/model/job_modal.dart';

class FolderPageProvider extends ChangeNotifier {
  bool loading = false;
  int totalImageToCopy = 0;
  int imageCopyed = 0;

  Future<bool> deleteFolder({required int folderId}) async {
    Uri url = Uri.parse('$host/deletefolder');
    Object body = jsonEncode({"folder_id": folderId});
    print("folder_id: $folderId");
    Response res = await delete(url, headers: {'Content-Type': 'application/json'}, body: body);
    if (res.statusCode == 200) {
      await FolderRepo().deleteFolder(folderId);
      return true;
    } else {
      print(res.reasonPhrase);
      return false;
    }
  }

  Future<void> copyImage(List<ImageModal> selectedImages, String path) async {
    totalImageToCopy = selectedImages.length;
    imageCopyed = 0;
    notifyListeners();
    for (ImageModal image in selectedImages) {
      try {
        File(image.localurl).copySync("$path/${image.image}");
        imageCopyed++;
        notifyListeners();
      } catch (e) {
        print(e);
      }
    }
  }

  // Future<bool> deleteImage({required String id, required int folderId, required JobImageModal image}) async {
  //   Uri url = Uri.parse('$host/deletefolder');
  //   Object body = jsonEncode({
  //     "id": id,
  //     "folder_id": folderId,
  //     "image": [
  //       {
  //         "id": image.backendId,

  //         "key": image.awsKey,
  //         "name": image.name,

  //       }
  //     ]
  //   });
  //   Response res = await delete(url, headers: {'Content-Type': 'application/json'}, body: body);
  //   if (res.statusCode == 200) {
  //     return FolderRepo().deleteImage(folderId).then((value) => true);
  //   } else {
  //     print(res.reasonPhrase);
  //     return false;
  //   }
  // }

  Future<bool> addImage({required List<PlatformFile> images, required String id, required JobModal folder}) async {
    print(folder.awsId);
    loading = true;
    notifyListeners();
    List<Map<String, dynamic>> map = [];
    for (var image in images) {
      print(image.name);
      print(image.path);
      File imageFile = File(image.path!);
      ImageFile inputimage = ImageFile(filePath: imageFile.path, rawBytes: imageFile.readAsBytesSync());
      Configuration config = const Configuration(outputType: ImageOutputType.jpg, quality: 40);
      final inputParam = ImageFileConfiguration(input: inputimage, config: config);
      final output = await compressor.compress(inputParam);
      Map<String, dynamic> lmap = {
        'name': image.name,
        'localURL': image.path,
        'base64': base64Encode(output.rawBytes),
      };
      map.add(lmap);
      notifyListeners();
    }

    Uri url = Uri.parse('$host/addimage');
    Object body = jsonEncode({
      "id": id,
      "aws_id": folder.awsId,
      "length": images.length,
      "image": map,
    });
    Response re = await post(url, headers: {'Content-Type': 'application/json'}, body: body);
    if (re.statusCode == 200) {
      print(jsonDecode(re.body));
      await FolderRepo().addImagesFromList(
        folder: folder,
        imagesMap: jsonDecode(re.body)['job'],
      );
      Hive.box('dll12').put('credit ', jsonDecode(re.body)['credit']);
      loading = false;
      notifyListeners();
      return true;
    } else {
      print(re.reasonPhrase);
      return false;
    }
  }
}
