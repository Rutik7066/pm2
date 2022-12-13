import 'package:isar/isar.dart';

part "whatsapp_temp_modal.g.dart";

@collection
class WhatsappModal {
  Id id = Isar.autoIncrement;
  late String name;
  late String message;
}
