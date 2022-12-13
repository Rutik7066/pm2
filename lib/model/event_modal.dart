import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:pm/model/bill_modal.dart';
import 'package:pm/model/customer_modal.dart';



part 'event_modal.g.dart';
@collection
class EventModal {
  Id id = Isar.autoIncrement;
  late String title;
  late String des;
  late DateTime date;
  final customer = IsarLink<CustomerModal>();
  final bill = IsarLink<BillModal>();
}
