import 'package:flutter/material.dart';
import 'package:pm/db/transaction_repo.dart';
import 'package:pm/model/customer_modal.dart';
import 'package:pm/model/transaction_modal.dart';

class NewTransactionProvider extends ChangeNotifier {
  String note = '';
  double amt = 0.0;
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  changeDate(DateTime date) {
    this.date = date;
    notifyListeners();
  }

  chnageTime(TimeOfDay time) {
    this.time = time;
    notifyListeners();
  }

  credit(CustomerModal customer) {
    TransactionModal transaction = TransactionModal()
      ..time = date.add(Duration(hours: time.hour, minutes: time.minute))
      ..title = note
      ..transactionAmt = 0 - amt;
    customer.dues = customer.dues - amt;
    TransactionRepo().addTransaction(transaction: transaction, customer: customer);
    note = '';
    amt = 0.0;
    date = DateTime.now();
    time = TimeOfDay.now();
    notifyListeners();
  }

  debit(CustomerModal customer) {
    TransactionModal transaction = TransactionModal()
      ..time = date.add(Duration(hours: time.hour, minutes: time.minute))
      ..title = note
      ..transactionAmt = amt;
    customer.dues = customer.dues + amt;
    TransactionRepo().addTransaction(transaction: transaction, customer: customer);
    note = '';
    amt = 0.0;
    date = DateTime.now();
    time = TimeOfDay.now();
    notifyListeners();
  }
}
