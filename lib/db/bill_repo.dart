import 'package:isar/isar.dart';
import 'package:pm/db/db.dart';
import 'package:pm/model/bill_modal.dart';
import 'package:pm/model/customer_modal.dart';
import 'package:pm/model/daily_modal.dart';
import 'package:pm/model/transaction_modal.dart';

import '../model/cart_item.dart';

class BillRepo {
  Future<BillModal> addBill({required BillModal bill, required List<CartItem> cart}) async {
    final isar = await openDb();
    await isar.writeTxn(() async {
      for (var element in cart) {
        await isar.cartItems.put(element);
        await element.product.save();
      }

      await isar.billModals.put(bill);
      bill.cart.addAll(cart);
      await bill.cart.save();
      DailyModal dail = DailyModal()
        ..amt = bill.paid
        ..note = 'Bill'
        ..time = DateTime.now();
      await isar.dailyModals.put(dail);
    });
    return bill;
  }

  Future<BillModal> addBillWithCustomer({required CustomerModal customer, required BillModal bill, required List<CartItem> cart}) async {
    final isar = await openDb();
    await isar.writeTxn(() async {
      await isar.customerModals.put(customer);
      await isar.billModals.put(bill);
      for (var element in cart) {
        await isar.cartItems.put(element);
        await element.product.save();
      }
      bill.cart.addAll(cart);
      bill.customer.value = customer;
      await bill.cart.save();
      await bill.customer.save();
      if (bill.dues != 0) {
        TransactionModal transaction = TransactionModal()
          ..title = 'Payment on Bill #${bill.id}'
          ..transactionAmt = bill.dues
          ..time = DateTime.now()
          ..customer.value = customer;
        await isar.transactionModals.put(transaction);
        customer.transaction.add(transaction);
      }
      await customer.transaction.save();
      DailyModal dail = DailyModal()
        ..amt = bill.paid
        ..note = customer.name
        ..time = DateTime.now();
      await isar.dailyModals.put(dail);
    });
    return bill;
  }

  Future addPaymentToBill(BillModal bill, int payment) async {
    TransactionModal tran = TransactionModal()
      ..time = DateTime.now()
      ..title = "Payment for ${bill.id}"
      ..transactionAmt = payment.toDouble()
      ..customer.value = bill.customer.value;
    final isar = await openDb();
    await isar.writeTxn(() async {
      bill.dues = bill.dues - payment;
      bill.paid = bill.paid + payment;
      if (bill.customer.value != null) {
        bill.customer.value!.dues = bill.customer.value!.dues - payment;
        await isar.customerModals.put(bill.customer.value!);
        print(bill.customer.value?.dues);
      }
      await isar.billModals.put(bill);
      await isar.transactionModals.put(tran);
      bill.customer.value?.transaction.add(tran);
      bill.customer.value?.transaction.save();
    });
  }

  Stream<List<BillModal>> listenToBills() async* {
    final isar = await openDb();
    yield* isar.billModals.where().sortByCreated().watch(fireImmediately: true);
  }

  Stream<BillModal?> listToBill({required int id}) async* {
    final isar = await openDb();
    yield* isar.billModals.watchObject(id, fireImmediately: true);
  }

  Future<void> deleteBill(int id) async {
    final isar = await openDb();
    await isar.writeTxn(() async {
      await isar.billModals.delete(id);
    });
  }
}
