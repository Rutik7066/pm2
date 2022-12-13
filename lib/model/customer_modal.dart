import 'package:isar/isar.dart';
import 'package:pm/model/bill_modal.dart';
import 'package:pm/model/event_modal.dart';
import 'package:pm/model/transaction_modal.dart';
part 'customer_modal.g.dart';

@collection
class CustomerModal {
  Id id = Isar.autoIncrement;
  late String name;
  late String number;
  late double dues;
  @Backlink(to: 'customer')
  final bill = IsarLinks<BillModal>();
  @Backlink(to: 'customer')
  final event = IsarLinks<EventModal>();
  @Backlink(to: 'customer')
  final transaction = IsarLinks<TransactionModal>();
}
