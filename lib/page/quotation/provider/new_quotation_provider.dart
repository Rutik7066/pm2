import 'package:flutter/material.dart';
import 'package:pm/db/qotation_repo.dart';
import 'package:pm/model/quotation_modal.dart';

import '../../../model/cart_item.dart';
import '../../../model/customer_modal.dart';
import '../../../model/product_modal.dart';

class NewQuotationProivder extends ChangeNotifier {
  String customerName = '';
  String customerNumber = '';
  CustomerModal? customer;
///////////////////////////////////
  List<CartItem> cart = [];
  ProductModal? currentProduct;
///////////////////////////////////
  double total = 0.0;
  double dis = 0.0;
  double finalamt = 0.0;

  addToCart({required String name, required double rate, required int qty}) {
    CartItem item = CartItem();
    item
      ..name = name
      ..qty = qty
      ..rate = rate
      ..total = (qty * rate)
      ..product.value = currentProduct;
    cart.add(item);
    total = total + (qty * rate);
    notifyListeners();
  }

  removeFromCart(int index) {
    cart.removeAt(index);
    double i = 0.0;
    for (CartItem c in cart) {
      i = i + c.total;
    }
    total = i;
    notifyListeners();
  }

  clearAll() {
    customerName = '';
    customerNumber = '';
    customer = null;
///////////////////////////////////
    cart = [];
    total = 0.0;
    dis = 0.0;
    finalamt = 0.0;
    notifyListeners();
  }

  Future<void> createQuote() async {
    customer ??= CustomerModal()
      ..name = customerName
      ..number = customerNumber
      ..dues = 0;
    QuotationModal quote = QuotationModal()
      ..cart.addAll(cart)
      ..customer.value = customer
      ..dis = dis
    
      ..finalamt = finalamt
      ..total = total;
    await QuotationRepo().addQuotation(quote: quote, customer: customer!,cart: cart);
  }
}
