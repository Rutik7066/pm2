import 'package:flutter/cupertino.dart';
import 'package:pm/model/event_modal.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderProvider extends ChangeNotifier {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime? focusedDay;
  DateTime? selectedDay;
  List<EventModal> eventList = [];

  List<EventModal> getEventForDay({required DateTime day, required List<EventModal> list}) {
    return list.where((e) {
      return e.date.year == day.year && e.date.month == day.month && e.date.day == day.day;
    }).toList();
  }

  onCalendarCreated(List<EventModal> list) {
    print('Hello');
    DateTime day = DateTime.now();
    eventList = list.where((e) {
      return e.date.year == day.year && e.date.month == day.month && e.date.day == day.day;
    }).toList();
  
  }

  onDaySelected({required DateTime selectedDay, required DateTime focusedDay, required List<EventModal> list}) {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
      eventList = getEventForDay(day: selectedDay, list: list);
    notifyListeners();
  }

  onFormatChanged(format) {
    if (calendarFormat != format) {
      calendarFormat = format;
    }
    notifyListeners();
  }

  onPageChanged(focusedDay) {
    this.focusedDay = focusedDay;
    notifyListeners();
  }
}
