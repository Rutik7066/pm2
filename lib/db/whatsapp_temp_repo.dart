import 'package:isar/isar.dart';
import 'package:isar_flutter_libs/isar_flutter_libs.dart';
import 'package:pm/db/db.dart';
import 'package:pm/model/whatsapp_temp_modal.dart';

class WhatsappTempRepo {
  Stream<List<WhatsappModal>> getWhatsappTemp() async* {
    final isar = await openDb();
    yield* isar.whatsappModals.where().watch(fireImmediately: true);
  }

  Future<void> createWhatsappTemp(WhatsappModal modal) async {
    final isar = await openDb();
    await isar.writeTxn(() async {
      await isar.whatsappModals.put(modal);
    });
  }

  Future<List<WhatsappModal>> listOfTemplate() async {
    final isar = await openDb();
    return  isar.whatsappModals.where().findAll();
  }

  Future<void> deleteWhatsappTemp(int id) async {
    final isar = await openDb();
    await isar.writeTxn(() async => await isar.whatsappModals.delete(id));
  }
}
