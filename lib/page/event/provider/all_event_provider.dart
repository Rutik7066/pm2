import 'package:flutter/material.dart';
import 'package:pm/db/event_repo.dart';
import 'package:pm/model/event_modal.dart';

class AllEventProvider extends ChangeNotifier {
  List<bool> list = [
    true, //  All
    false, // old
    false, // upcomming
  ];

  void toggle({required int index}) {
    List<bool> templist = [false,false,false];
    templist[index] = !templist[index];
    list = templist;

    notifyListeners();
  }

  Stream<List<EventModal>> eventList() async* {
    if (list[1] == true) {
      yield* EventRepo().listenToOlderEvent();

    } else if (list[2] == true) {
      yield* EventRepo().listenToUpcommingEvent();

    } else {
      yield* EventRepo().listenToEvent();

    }
  }
}
