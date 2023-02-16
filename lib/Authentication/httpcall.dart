import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:pm/Authentication/httpcall_dbop.dart';
import 'package:pm/Authentication/user.dart';
import 'package:pm/const.dart';
import 'package:pm/pb.dart';
import 'package:pocketbase/pocketbase.dart';

class HttpCall {
  String orderId = '';
  Future<Map<String, dynamic>> makeReq({required String url, required Map<String, dynamic> map, Map<String, String>? header}) async {
    var urlu = Uri.parse(url);
    var body = jsonEncode(map);
    var headers = header ?? {'content-type': 'application/json'};
    var res = await http.post(urlu, headers: headers, body: body);
    print(res.statusCode);
    Map<String, dynamic> mapp = jsonDecode(res.body);
    return mapp;
  }

  Future<Uint8List?> getQr({required String name, required String phone, required String email}) async {
    var body = {
      'order_amount': 700.00.toString(),
      "order_note": 'Purchase 1 year',
      'id': User.fromBox().id.toString(),
      'customer_name': name,
      'customer_email': email,
      'customer_phone': '+91$phone',
    };
    Map<String, dynamic> map = await makeReq(url: '$host/getcrftoken', map: body);
    print(map);
    orderId = map['order_token'];
    Uint8List byte = await getDecodedQr(map['order_token']);
    return byte;
  }

  Future<Uint8List> getDecodedQr(String id) async {
    var body = {
      "order_token": id,
      "payment_method": {
        "upi": {"channel": "qrcode"}
      }
    };
    Map<String, dynamic> map = await makeReq(url: cfr, map: body, header: {'content-type': 'application/json', 'x-api-version': '2022-01-01'});
    String qr = map['data']['payload']['qrcode'].toString().split(',').last;
    Uint8List qrimg = base64Decode(qr);
    return qrimg;
  }

  Future<bool> login({required String email, required String password}) async {
    late RecordAuth authData;
    try {
      authData = await pb.collection('userpm').authWithPassword(
            email,
            password,
          );
      log(authData.record!.id);
      print(pb.authStore.isValid);
    } on ClientException catch (error) {
      print(error.response["data"]);
    }

    if (pb.authStore.isValid) {
      print(authData.record?.data);
      addUser(authData.record!.data, authData.record!.id);
    }
    return pb.authStore.isValid;
  }

  Future<String?> demo() async {
    Uri url = Uri.parse('$host/demo');
    print('$host/demo');
    var headers = {'content-type': 'application/json'};
    var body = jsonEncode({
      "customer_name": "Demo Account",
      "customer_phone": "1111111111",
      "customer_alt_phone": "2222222222",
      "customer_email": "demo@gmail.com",
      "password": "45645674894sfg5",
      "business_name": "Demo Studio",
      "business_address": "Business  Address",
      "fb_id": "fb_id",
      "snap_id": "snap_id",
      "insta_id": "insta_id",
      'web': 'www.photographymanager.in',
      'youtube': 'youtube',
      "ip_address": "ip_address",
      "plan_price": 0.00,
      "jobs": [],
    });
    var res = await http.post(url, body: body);
    if (res.statusCode == 200) {
      await HttpCallDbop().loginDbOp(jsonDecode(res.body));
    }
    print(res.body);
    return jsonDecode(res.body)['message'];
  }
}
