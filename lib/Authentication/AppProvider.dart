import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:pm/Authentication/user.dart';
import 'package:pm/const.dart';

class AppProvider extends ChangeNotifier {
  bool isLoggedin = false;
  DateTime? getValidity() {
    Box map = Hive.box('dll12');

    return DateTime.tryParse(map.get('valid_till').toString());
  }

  check() {
    DateTime? validtill = getValidity();
    print("Validity " + validtill.toString());
    // Checking today date is before the or same to user validity.
    if (DateTime.now().isBefore(validtill ?? DateTime.now()) || DateTime.now().day == validtill?.day) {
      isLoggedin = true;
    } else {
      isLoggedin = false;
    }
    print("check " + isLoggedin.toString());
  }

  recheck() {
    DateTime? validtill = getValidity();
    // Checking today date is before the or same to user validity.
    if (DateTime.now().isBefore(validtill ?? DateTime.now()) || DateTime.now().day == validtill?.day) {
      isLoggedin = true;
    } else {
      isLoggedin = false;
    }
    print(isLoggedin);
    notifyListeners();
  }

  Future logOut() async {
    Hive.box('dll12').delete('uid');
    Hive.box('dll12').delete('valid_till');
    isLoggedin = false;
    notifyListeners();
  }

// Log for everyday
  Future<void> logIn() async {
    Box map = Hive.box('dll12');
    map.delete("jobs");
    String? email = map.get('customer_email');
    String? pass = map.get('password');
    var url = Uri.http('$host/login');
    var res = await post(
      url,
      headers: {'content-type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': pass,
      }),
    );
    print("everu Day Log In");
    print(res.body);
    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body);
      addUser(map).catchError((c) => null);
    }
  }
}
