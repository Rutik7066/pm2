import 'package:flutter/material.dart';
import 'package:pm/db/product_repo.dart';
import 'package:pm/model/product_modal.dart';

class ProductProvider extends ChangeNotifier {
  String? filter;

  changeFilter(String v) {
    filter = v;
    notifyListeners();
  }

  Stream<List<ProductModal>> listenToProduct() {
    if (filter != null) {
      return ProductRepo().listenToOneProduct(filter!);
    } else {
      return ProductRepo().listenToProduct();
    }
  }
}
