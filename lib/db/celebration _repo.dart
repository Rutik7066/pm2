import 'package:pm/db/db.dart';
import 'package:pm/model/celebration_modal.dart';
import "package:isar/isar.dart";

class CelebrationRepo {
  Future<void> addCelebration(CelebrationModal celebration) async {
    final isar = await openDb();
    await isar.writeTxn(() async {
      await isar.celebrationModals.put(celebration);
    });
  }

  Stream<List<CelebrationModal>> getCelebrationFromToday() async* {
    final isar = await openDb();
    yield* isar.celebrationModals.filter().monthGreaterThan(DateTime.now().month - 1).and().dateGreaterThan(DateTime.now().day - 1).watch(fireImmediately: true);
  }
}
