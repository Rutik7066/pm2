import 'package:isar/isar.dart';
import 'package:pm/model/cart_item.dart';

part 'product_modal.g.dart';

@collection
class ProductModal {
  Id id = Isar.autoIncrement;
  late String name;
  late double price;
  List<String>? element;
  final cartItems = IsarLinks<CartItem>();
}
