import 'package:isar/isar.dart';
import 'package:pm/db/db.dart';
import 'package:pm/model/bill_modal.dart';
import 'package:pm/model/cart_item.dart';
import 'package:pm/model/celebration_modal.dart';
import 'package:pm/model/customer_modal.dart';
import 'package:pm/model/event_modal.dart';

import '../model/daily_modal.dart';
import '../model/transaction_modal.dart';

class EventRepo {
  Future<void> addEvent({
    required CustomerModal customer,
    required BillModal bill,
    required EventModal event,
    required List<CartItem> cart,
  }) async {
    final eve = event.title.toLowerCase();
    final isar = await openDb();
    await isar.writeTxn(() async {
      await isar.cartItems.putAll(cart);
      for (var element in cart) {
        await isar.cartItems.put(element);
        await element.product.save();
      }
      await isar.billModals.put(bill);
      await isar.eventModals.put(event);
      await isar.customerModals.put(customer);
      await customer.bill.save();
      await customer.event.save();
      await bill.cart.save();
      await bill.event.save();
      await event.bill.save();
      await event.customer.save();
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
      if (eve.startsWith("wed") || eve.startsWith("bir")) {
        CelebrationModal cele = CelebrationModal()
          ..celebration = event.title
          ..customer = customer.name
          ..number = customer.number
          ..date = event.date.day
          ..month = event.date.month;
        await isar.celebrationModals.put(cele);
      }
      DailyModal dail = DailyModal()
        ..amt = bill.paid
        ..note = 'Event Bill'
        ..time = DateTime.now();
      await isar.dailyModals.put(dail);
    });
  }

  Future addPaymentToEvent(EventModal event, int payment) async {
    final isar = await openDb();
    TransactionModal tran = TransactionModal()
      ..time = DateTime.now()
      ..title = "Payment for ${event.title}"
      ..transactionAmt = payment.toDouble()
      ..customer.value = event.customer.value;
    await isar.writeTxn(() async {
      event.bill.value?.dues = event.bill.value!.dues - payment;
      event.bill.value?.paid = event.bill.value!.paid + payment;
      await isar.eventModals.put(event);
      await isar.billModals.put(event.bill.value!);
      if (event.customer.value != null) {
        event.customer.value!.dues = event.customer.value!.dues - payment;
        await isar.customerModals.put(event.customer.value!);

        print(event.customer.value?.dues);
      }
      await isar.transactionModals.put(tran);
      await event.bill.save();
      event.customer.value?.transaction.add(tran);
      event.customer.value?.transaction.save();
    });
  }

  Stream<List<EventModal>> listenToEvent() async* {
    final isar = await openDb();
    yield* isar.eventModals.where().sortByDate().watch(fireImmediately: true);
  }

  Stream<List<EventModal>> listenToOlderEvent() async* {
    final isar = await openDb();
    yield* isar.eventModals.filter().dateLessThan(DateTime.now()).watch(fireImmediately: true);
  }

  Stream<List<EventModal>> listenToUpcommingEvent() async* {
    final isar = await openDb();
    yield* isar.eventModals.filter().dateGreaterThan(DateTime.now()).watch(fireImmediately: true);
  }

  Stream<EventModal?> listenToSingleEvent(int id) async* {
    final isar = await openDb();
    yield* isar.eventModals.watchObject(id, fireImmediately: true);
  }

  Future<List<EventModal>> getEventForDay(DateTime date) async {
    final isar = await openDb();
    return isar.eventModals.filter().dateEqualTo(DateTime(date.year, date.month, date.day)).findAllSync();
  }

  Future<void> deleteEvent(int id) async {
    final isar = await openDb();
    await isar.writeTxn(() async => await isar.eventModals.delete(id));
  }
}
