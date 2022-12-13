import 'package:pm/db/db.dart';
import 'package:pm/model/transaction_modal.dart';

import '../model/customer_modal.dart';

class TransactionRepo {
  Future<void> addTransaction({required TransactionModal transaction, required CustomerModal customer}) async {
    final isar = await openDb();
    await isar.writeTxn(() async {
      await isar.customerModals.put(customer);
      await isar.transactionModals.put(transaction);
      customer.transaction.add(transaction);
      await customer.transaction.save();
      transaction.customer.value = customer;
      await transaction.customer.save();
    });
  }

  Future<void> deleteTransaction(int id) async {
    final isar = await openDb();
    await isar.writeTxn(() async {
      await isar.transactionModals.delete(id);
    });
  }
}
