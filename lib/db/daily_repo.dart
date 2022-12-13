import 'package:pm/db/db.dart';
import 'package:pm/model/daily_modal.dart';
import 'package:isar/isar.dart';

class DailyRepo {
  Stream<List<DailyModal>> listenToDaily() async* {
    final isar = await openDb();
    yield* isar.dailyModals.where().watch(fireImmediately: true);
  }
}
