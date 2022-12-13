import 'package:isar/isar.dart';
import 'package:pm/db/db.dart';
import 'package:pm/model/expense_modal.dart';

import '../model/daily_modal.dart';

class ExpenseRepo {
  Future<void> addExp(ExpenseModal exp) async {
    final isar = await openDb();
    await isar.writeTxn(() async {
      await isar.expenseModals.put(exp);
      DailyModal dail = DailyModal()
        ..amt = exp.amount
        ..note = exp.title
        ..time = DateTime.now();
      await isar.dailyModals.put(dail);
    });
  }

  Stream<List<ExpenseModal>> listenToExpense() async* {
    final isar = await openDb();
    yield* isar.expenseModals.where(sort: Sort.desc).watch(fireImmediately: true);
  }
}
