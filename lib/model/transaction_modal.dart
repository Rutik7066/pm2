import 'package:isar/isar.dart';
import 'package:pm/model/customer_modal.dart';

part 'transaction_modal.g.dart';

@collection
class TransactionModal {
  Id id = Isar.autoIncrement;
  final customer = IsarLink<CustomerModal>();
  late String title;
  late DateTime time;
  late double transactionAmt;
}
