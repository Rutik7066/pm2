import 'package:isar/isar.dart';

part 'daily_modal.g.dart';

@collection
class DailyModal {
  Id id = Isar.autoIncrement;
  late String note;
  late DateTime time;
  late double amt;
}
