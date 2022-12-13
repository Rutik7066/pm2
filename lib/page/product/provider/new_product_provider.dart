import 'package:flutter/material.dart';
import 'package:pm/db/product_repo.dart';
import 'package:pm/model/product_modal.dart';

class NewProductProivder extends ChangeNotifier {
  String productName = '';
  double productPrice = 0.0;
  List<String> desList = [];

  addDes(String des) {
    desList.add(des);
    notifyListeners();
  }

  removeDes(int index) {
    desList.removeAt(index);
    notifyListeners();
  }

  addProduct() async {
    ProductModal product = ProductModal();
    product
      ..name = productName
      ..price = productPrice
      ..element = desList;
    await ProductRepo.addProduct(product);
  }
}
