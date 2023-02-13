import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pm/Authentication/httpcall_dbop.dart';
import 'package:pm/Authentication/user.dart';
import 'package:pm/const.dart';

import 'package:http/http.dart';

class CloudGalleryProvider extends ChangeNotifier {
  // 0 = loading
  // 1 = done
  // 2 = error
  int reqCode = 1;
  Future<void> getCustomer() async {
    Uri url = Uri.parse('$host/getcustomer');
    var re = await post(url, headers: {'content-type': 'application/json'}, body: jsonEncode({"id": User.fromBox().id}));
    if (re.statusCode == 200) {
      print(re.body);
      var result = await HttpCallDbop().getCustomer(jsonDecode(re.body));
      print("getCustomer");
      if (result) {
        reqCode = 1;
      }
    } else {
      print(re.reasonPhrase);
      reqCode = 2;
      notifyListeners();
    }
  } // gjhgjghjgjh

  Future<void> getCustomer2() async {
    try {
      Uri url = Uri.parse('$host/getcustomer');
      var re = await post(url, headers: {'content-type': 'application/json'}, body: jsonEncode({"id": User.fromBox().id}));
      if (re.statusCode == 200) {
        print(re.statusCode);
        await HttpCallDbop().getCustomer(jsonDecode(re.body));
      } else {
        print(re.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }
}
