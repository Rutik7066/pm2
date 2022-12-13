
import 'package:flutter/material.dart';
import 'package:pm/db/event_repo.dart';
import 'package:pm/model/bill_modal.dart';
import 'package:pm/model/cart_item.dart';
import 'package:pm/model/customer_modal.dart';
import 'package:pm/model/event_modal.dart';
import 'package:pm/model/product_modal.dart';

class NewEventProvider extends ChangeNotifier {
  String customerName = '';
  String customerNumber = '';
  CustomerModal? customer;
//////////////////////////////////////////////
  ProductModal? product;
  List<CartItem> cart = [];
//////////////////////////////////////////////
  double total = 0.0;
  double dis = 0.0;
  double finalamt = 0.0;
  double paid = 0.0;
  double dues = 0.0;
///////////////////////////////////////////////
  String title = '';
  DateTime? date;
  TimeOfDay? time;
  String des = '';

  changeDate(DateTime? pickedate) {
    date = pickedate;
    notifyListeners();
  }

  changeTime(TimeOfDay pickedTime) {
    time = pickedTime;
    notifyListeners();
  }

  void addToCart({required String name, required int qty, required double rate}) {
    CartItem i = CartItem()
      ..name = name
      ..qty = qty
      ..rate = rate
      ..total = (qty * rate)
      ..product.value = product;
    cart.add(i);
    total = total + (qty * rate);
    notifyListeners();
  }

  void removeFromCart(int index) {
    cart.removeAt(index);
    double i = 0.0;
    for (CartItem c in cart) {
      i = i + c.total;
    }
    total = i;
    notifyListeners();
  }

  Future<void> newEvent() async {
    dues = finalamt - paid;
    BillModal bill = BillModal()
      ..cart.addAll(cart)
      ..dis = dis
      ..dues = dues
      ..finalamt = finalamt
      ..paid = paid
      ..total = total;
    EventModal event = EventModal()
      ..date = DateTime(
        date!.year,
        date!.month,
        date!.day,
        time != null ? time!.hour : 0,
        time != null ? time!.minute : 0,
      )
      ..des = des
      ..title = title;

    if (customer != null && customerName.isNotEmpty && customerNumber.isNotEmpty) {
      customer!.dues = customer!.dues + dues;
      customer!.bill.add(bill);
      customer!.event.add(event);
    } else if (customer == null && customerName.isNotEmpty && customerNumber.isNotEmpty) {
      customer = CustomerModal()
        ..name = customerName
        ..number = customerNumber
        ..dues = dues
        ..bill.add(bill)
        ..event.add(event);
    }
    event.customer.value = customer;
    event.bill.value = bill;
    bill.customer.value = customer;
    bill.event.value = event;
    await EventRepo().addEvent(customer: customer!, bill: bill, event: event, cart: cart);
  }

  void clearAll() {
    customerName = '';
    customerNumber = '';
    customer = null;
    product = null;
    cart = [];
    total = 0.0;
    dis = 0.0;
    finalamt = 0.0;
    paid = 0.0;
    dues = 0.0;
    title = '';
    date = null;
    des = '';
    notifyListeners();
  }
}
