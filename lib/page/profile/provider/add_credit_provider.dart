import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:pm/Authentication/user.dart';
import 'package:pm/const.dart';

class AddCreditProvider extends ChangeNotifier {
  int selected = 10;
  Map<String, dynamic>? planMap;
  Uint8List? qrImage;
  bool loading = false;
  String token = '';
  bool? status;

  changeSelected(int number, Map<String, dynamic> plan) {
    selected = number;
    planMap = plan;
    print(planMap);
    notifyListeners();
  }

  Future<List> getPlan() async {
    Uri url = Uri.parse('$host/getplan');
    var re = await get(url, headers: {'content-type': 'application/json'});
    print(re.body);
    return jsonDecode(re.body)['plan'];
  }

  Future<void> addCreditQr() async {
    // Get Token
    loading = true;
    notifyListeners();
    User user = User.fromBox();
    Uri tokenUrl = Uri.parse('$host/getcrftoken');
    var data = jsonEncode({
      'order_amount': planMap!['price'].toString(),
      "order_note": planMap!['name'],
      'uid': User.fromBox().uid.toString(),
      'customer_name': user.name,
      'customer_email': user.email,
      'customer_phone': '+91${user.number}',
    });
    var qrre = await post(tokenUrl, headers: {'content-type': 'application/json'}, body: data);
    print(qrre.body);
    if (qrre.statusCode == 200) {
      String tokenRe = jsonDecode(qrre.body)['order_token'];
      token = tokenRe;
      print(tokenRe);
      Uri qrUrl = Uri.parse(cfr);
      var body = jsonEncode({
        "order_token": tokenRe,
        "payment_method": {
          "upi": {"channel": "qrcode"}
        }
      });
      // Get QR

      var qr = await post(qrUrl, headers: {'content-type': 'application/json', 'x-api-version': '2022-01-01'}, body: body);
      print(qr.body);

      if (qr.statusCode == 200) {
        Map<String, dynamic> qrMap = jsonDecode(qr.body);
        print(qrMap);
        String base64QR = qrMap['data']['payload']['qrcode'].toString().split(',').last;
        Uint8List qrData = base64Decode(base64QR);
        qrImage = qrData;
        loading = false;
        notifyListeners();
      }
    }
  }

  Future<void> validate() async {
    Uri url = Uri.parse('$host/updatecredit');
    var data = jsonEncode({
      'order_id': token,
      'uid': User.fromBox().uid.toString(),
      'plan_name': planMap!['name'],
    });
    var re = await post(url, headers: {'content-type': 'application/json'}, body: data);
    if (re.statusCode == 200) {
      int credit = jsonDecode(re.body)['credit'];
      await Hive.box('dll12').put('credit', credit);
      status = true;
      notifyListeners();
    } else {
      status = false;
      notifyListeners();
    }
  }
}
