import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:pm/model/job_modal.dart';

part 'job_image_modal.g.dart';

@collection
class JobImageModal {
  Id? id;
  late String name;
  late String awsKey;// location
  late String localurl;
  late String url;

  late bool isSelected;
  // Extra backend reff
  late int backendId;
  late int backendfolderid;
}
