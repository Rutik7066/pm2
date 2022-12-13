import 'package:isar/isar.dart';

part 'celebration_modal.g.dart';

@collection
class CelebrationModal {
  Id id = Isar.autoIncrement;
  late String celebration;
  late int date;
  late int month;
  late String customer;
  late String number;
}
