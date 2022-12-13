import 'package:flutter/material.dart';
import 'package:pm/db/bill_repo.dart';
import 'package:pm/model/bill_modal.dart';
import 'package:pm/model/cart_item.dart';
import 'package:pm/model/customer_modal.dart';
import 'package:pm/model/product_modal.dart';

class CreateBillPro extends ChangeNotifier {
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
  double paid = 0.0;
  double dues = 0.0;

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
    paid = 0.0;
    dues = 0.0;
    notifyListeners();
  }

  Future<BillModal> createBill() async {
    print(customer != null);
    print(customerName.isNotEmpty);
    print(customerNumber.isNotEmpty);
    BillModal bill = BillModal();
    dues = finalamt - paid;
    if (customer != null && customerName.isNotEmpty && customerNumber.isNotEmpty) {
      if (customer!.name == customerName && customer!.number == customerNumber) {
        customer!.dues = customer!.dues + dues;
        bill
          ..dis = dis
          ..dues = dues
          ..finalamt = finalamt
          ..paid = paid
          ..total = total
          ..cart.addAll(cart);
        return await BillRepo().addBillWithCustomer(customer: customer!, bill: bill, cart: cart);
      }
    } else if (customer == null && customerName.isNotEmpty && customerNumber.isNotEmpty) {
      customer = CustomerModal()
        ..name = customerName
        ..number = customerNumber
        ..dues = dues;
      print('${customer?.name}${customer?.number}${customer?.dues}');
      bill
        ..dis = dis
        ..dues = dues
        ..finalamt = finalamt
        ..paid = paid
        ..total = total
        ..cart.addAll(cart);
      return await BillRepo().addBillWithCustomer(customer: customer!, bill: bill, cart: cart);
    } else {
      print('else');
      bill
        ..dis = dis
        ..dues = dues
        ..finalamt = finalamt
        ..paid = paid
        ..total = total
        ..cart.addAll(cart);
      return await BillRepo().addBill(bill: bill, cart: cart);
    }
    return bill;
  }
}
