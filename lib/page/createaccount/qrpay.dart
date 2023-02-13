import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pm/Authentication/httpcall.dart';
import 'package:pm/Authentication/user.dart';
import 'package:pm/common_widget/elevated_btn.dart';
import 'package:http/http.dart' as htp;
import 'package:pm/const.dart';
import 'package:provider/provider.dart';
import '../../Authentication/AppProvider.dart';

class Qr extends StatefulWidget {
  const Qr({
    Key? key,
    required this.http,
    required this.email,
    required this.name,
    required this.phone,
    required this.textTheme,
    required this.pass,
  }) : super(key: key);

  final HttpCall http;
  final String email;
  final String name;
  final String phone;
  final String pass;
  final TextTheme textTheme;

  @override
  State<Qr> createState() => _QrState();
}
 
class _QrState extends State<Qr> {
  String? err;
  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppProvider>(context);
    final textTheme = Theme.of(context).textTheme;
    return AlertDialog(
      content: SizedBox(
        width: 300,
        height: 400,
        child: Column(
          children: [
            FutureBuilder(
              future: widget.http.getQr(email: widget.email, name: widget.name, phone: widget.phone),
              builder: (context, data) {
                if (data.hasData) {
                  return Image.memory(
                    data.data!,
                    width: 300,
                    height: 300,
                  );
                } else if (data.hasError) {
                  return Text(
                    'Internet not found',
                    style: widget.textTheme.titleLarge,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            if (err != null)
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  border: Border.all(color: Colors.red, width: 0.2, strokeAlign: StrokeAlign.inside),
                  borderRadius: const BorderRadius.all(Radius.circular(3)),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        MaterialIcons.sms_failed,
                        size: 15,
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        err!,
                        style: textTheme.bodyLarge!.copyWith(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
      actions: [
        ElevatedBtn(
          child: const Text('Verify'),
          onPressed: () async {
            var url = Uri.parse('$host/confirmandcreate');
            Map<String, dynamic> reqMap = {
              "order_id": widget.http.orderId,
              "customer_name": widget.name,
              "customer_phone": widget.phone,
              "customer_alt_phone": "",
              "customer_email": widget.email,
              "password": widget.pass,
              "fb_id": "",
              "insta_id": "",
              "web": "",
              "ip_address": '',
              "plan_price": 700.00,
            };
            var res = await htp.post(url, body: jsonEncode(reqMap), headers: {'content-type': 'application/json'});
           
            if (res.statusCode == 200) {
              Map<String, dynamic> data = jsonDecode(res.body);
              data.remove("jobs");
              addUser(data,"").then((value) => app.recheck());
            } else {
              setState(() {
                err = "Payment Failed.";
              });
            }
          },
        )
      ],
    );
  }
}
