import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';

class User {
  late String id;
  late String name;
  late String number;
  String? altnumber;
  late String bussinessname;
  late String bussinessadress;
  late String email;
  late String pass;
  String? web;
  String? fb;
  String? insta;
  String? youtube;
  String? snap;
  late String ip;
  late String planprice;
  late int credit;
  Uint8List? logo;
  DateTime? validtill;
  String? terms;
  User({
    this.logo,
    required this.id,
    required this.name,
    required this.number,
    this.altnumber,
    required this.bussinessname,
    required this.bussinessadress,
    required this.email,
    required this.pass,
    this.web,
    this.fb,
    this.insta,
    this.terms,
    this.youtube,
    this.snap,
    required this.ip,
    required this.planprice,
    required this.credit,
    this.validtill,
  });

//  To  get From DB
  factory User.fromBox() {
    Box map = Hive.box('dll12');
    return User(
      id: map.get('id') ?? '',
      name: map.get('name') ?? "",
      number: map.get('number') ?? "",
      altnumber: map.get('altnumber') ?? "",
      bussinessname: map.get('business_name') ?? "",
      bussinessadress: map.get('business_address') ?? "",
      email: map.get('email') ?? "",
      pass: map.get('password') ?? "",
      web: map.get('web') ?? "",
      fb: map.get('fb_id') ?? "",
      insta: map.get('insta_id') ?? "",
      youtube: map.get('youtube') ?? "",
      snap: map.get('snap_id') ?? "",
      ip: map.get('ip_address') ?? "",
      planprice: map.get('plan_price').toString(),
      credit: map.get('credit') ?? 0,
      validtill: DateTime.tryParse(map.get('valid_till').toString()),
      logo: map.get('logo'),
      terms: map.get('term'),
    );
  }

  factory User.listenable(Box map) {
    return User(
      id: map.get('id') ?? '',
      name: map.get('name') ?? "",
      number: map.get('number') ?? "",
      altnumber: map.get('altnumber') ?? "",
      bussinessname: map.get('business_name') ?? "",
      bussinessadress: map.get('business_address') ?? "",
      email: map.get('email') ?? "",
      pass: map.get('password') ?? "",
      web: map.get('web') ?? "",
      fb: map.get('fb_id') ?? "",
      insta: map.get('insta_id') ?? "",
      youtube: map.get('youtube') ?? "",
      snap: map.get('snap_id') ?? "",
      ip: map.get('ip_address') ?? "",
      planprice: map.get('plan_price') ?? "",
      credit: map.get('credit') ?? 0,
      validtill: DateTime.tryParse(map.get('valid_till').toString()),
      logo: map.get('logo'),
      terms: map.get('term'),
    );
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, number: $number, altnumber: $altnumber, bussinessname: $bussinessname, bussinessadress: $bussinessadress, email: $email, pass: $pass, web: $web, fb: $fb, insta: $insta, youtube: $youtube, snap: $snap, ip: $ip, planprice: $planprice, credit: $credit, validtill: $validtill)';
  }
}

Box map = Hive.box('dll12');

Future<void> addUser(Map<String, dynamic> reqmap, id) async {
  reqmap['id'] = id;
  await map.putAll(reqmap);
}

User getUser() {
  return User(
    id: map.get('id') ?? "",
    name: map.get('name') ?? "",
    number: map.get('number') ?? "",
    altnumber: map.get('altnumber') ?? "",
    bussinessname: map.get('business_name') ?? "",
    bussinessadress: map.get('business_address') ?? "",
    email: map.get('email') ?? "",
    pass: map.get('password') ?? "",
    web: map.get('web') ?? "",
    fb: map.get('fb_id') ?? "",
    insta: map.get('insta_id') ?? "",
    youtube: map.get('youtube') ?? "",
    snap: map.get('snap_id') ?? "",
    ip: map.get('ip_address') ?? "",
    planprice: map.get('plan_price') ?? 0,
    credit: map.get('credit') ?? 0,
    validtill: map.get('valid_till') as DateTime?,
  );
}
