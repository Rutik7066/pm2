import 'package:isar/isar.dart';
import 'package:pm/model/bill_modal.dart';
import 'package:pm/model/product_modal.dart';

part 'cart_item.g.dart';

@collection
class CartItem {
  Id id = Isar.autoIncrement;
  late String name;
  late double rate;
  late int qty;
  late double total;
  DateTime date = DateTime.now();
  final product = IsarLink<ProductModal>();
  final bill = IsarLink<BillModal>();
}
