import 'package:isar/isar.dart';
import 'package:pm/model/cart_item.dart';
import 'package:pm/model/customer_modal.dart';
import 'package:pm/model/event_modal.dart';

part 'bill_modal.g.dart';

@collection
class BillModal {
  Id id = Isar.autoIncrement;
  final customer = IsarLink<CustomerModal>();
  final event = IsarLink<EventModal>();
  final cart = IsarLinks<CartItem>();
  late double total;
  late double dis;
  late double finalamt;
  late double paid;
  late double dues;
  DateTime created = DateTime.now();
}
