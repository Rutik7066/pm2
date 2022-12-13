import 'package:isar/isar.dart';
import 'package:pm/model/cart_item.dart';
import 'package:pm/model/customer_modal.dart';

part 'quotation_modal.g.dart';

@collection
class QuotationModal {
  Id id = Isar.autoIncrement;
  final customer = IsarLink<CustomerModal>();
  final cart = IsarLinks<CartItem>();
  late double total;
  late double dis;
  late double finalamt;
  DateTime created = DateTime.now();
}
