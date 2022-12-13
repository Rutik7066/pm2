import 'package:isar/isar.dart';
import 'package:pm/model/customer_modal.dart';
import 'package:pm/model/job_image_modal.dart';

part 'job_modal.g.dart';

@collection
class JobModal {
  Id? id;
  late String awsId;
  late int status;
  late int length;

  var images = IsarLinks<JobImageModal>();
  var cust = IsarLink<CustomerModal>();
  // backend reff
  late int backendId;
  late int userId;
}
