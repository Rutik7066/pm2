import 'package:isar/isar.dart';


part 'expense_modal.g.dart';
@collection
class ExpenseModal {
  Id id = Isar.autoIncrement;
  late String title;
  late double amount;
  late DateTime date;
  
}
