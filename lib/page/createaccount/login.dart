import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:http/http.dart';
import 'package:pm/Authentication/httpcall.dart';
import 'package:pm/Authentication/user.dart';
import 'package:pm/common_widget/border_container.dart';
import 'package:pm/common_widget/custom_text_input.dart';
import 'package:pm/common_widget/elevated_btn.dart';
import 'package:provider/provider.dart';

import '../../Authentication/AppProvider.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email = '';
  String pass = '';
  final formKey = GlobalKey<FormState>();

  String? err;
  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppProvider>(context);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Container(
          child: Form(
            key: formKey,
            child: SizedBox(
              width: 400,
              height: 350,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/pngLogo.png', width: 30),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Photography Manager',
                          style: textTheme.headline4,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Log in',
                      style: textTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFormTextField(
                      // prefixIcon: Icon(Ion),
                      labelText: 'Email',
                      onSaved: (v) {
                        email = v!;
                      },
                      validator: (b) {
                        if (b == null || b.isEmpty) {
                          return 'Enter Email';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFormTextField(
                      obscureText: true,
                      labelText: 'Password',
                      onSaved: (v) {
                        pass = v!;
                      },
                      validator: (b) {
                        if (b == null || b.isEmpty) {
                          return 'Enter Password';
                        } else {
                          return null;
                        }
                      },
                    ),
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
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                              const Size(150, 35),
                            ),
                          ),
                          child: const Text('Try 3 Day Demo'),
                          onPressed: () async {
                            var connectivityResult = await (Connectivity().checkConnectivity());
                            if (connectivityResult == ConnectivityResult.none) {
                              SnackBar snack = const SnackBar(
                                content: Text('Internet Not Available'),
                                backgroundColor: Colors.red,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snack);
                              return;
                            }
                            print(email + pass);
                            String? res = await HttpCall().demo();
                            if (res != null) {
                              setState(() {
                                err = res;
                              });
                            } else {
                              app.recheck();
                            }
                          },
                        ),
                        ElevatedBtn(
                          child: const Text('Log in'),
                          onPressed: () async {
                            var connectivityResult = await (Connectivity().checkConnectivity());
                            if (connectivityResult == ConnectivityResult.none) {
                              SnackBar snack = const SnackBar(
                                content: Text('Internet Not Available'),
                                backgroundColor: Colors.red,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snack);
                              return;
                            }
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              print(email + pass);
                              String? res = await HttpCall().login(email: email, password: pass);
                              if (res != null) {
                                setState(() {
                                  err = res;
                                });
                              } else {
                                app.recheck();
                              }
                            }
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
