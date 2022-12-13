import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pm/Authentication/AppProvider.dart';
import 'package:pm/page/bill/provider/create_bill_provider.dart';
import 'package:pm/page/createaccount/login.dart';
import 'package:pm/page/credit_management/provider/new_transaction_provider.dart';
import 'package:pm/page/event/provider/all_event_provider.dart';
import 'package:pm/page/photo_gallery/provider/cloud_gallery_provider.dart';
import 'package:pm/page/photo_gallery/provider/create_folder_provider.dart';
import 'package:pm/page/photo_gallery/provider/folder_page_provider.dart';
import 'package:pm/page/product/provider/new_product_provider.dart';
import 'package:pm/page/customer/provider/customer_provider.dart';
import 'package:pm/page/event/provider/calender_provider.dart';
import 'package:pm/page/event/provider/new_event_provider.dart';
import 'package:pm/page/product/provider/product_provider.dart';
import 'package:pm/page/profile/provider/add_credit_provider.dart';
import 'package:pm/page/quotation/provider/all_quotation_provider.dart';
import 'package:pm/page/quotation/provider/new_quotation_provider.dart';
import 'package:pm/route/route.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'package:hive/hive.dart';

void main() async {
  var dir = Directory.current.path;
  print(dir);
  Hive.init(dir);
  await Hive.openBox('dll12');
  await CloudGalleryProvider().getCustomer2();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppProvider(),
        builder: (context, child) {
          var app = Provider.of<AppProvider>(context);

          return MultiProvider(
            providers: [
              ChangeNotifierProvider<CreateBillPro>.value(value: CreateBillPro()),
              ChangeNotifierProvider<NewProductProivder>.value(value: NewProductProivder()),
              ChangeNotifierProvider<NewEventProvider>.value(value: NewEventProvider()),
              ChangeNotifierProvider<CalenderProvider>.value(value: CalenderProvider()),
              ChangeNotifierProvider<AllEventProvider>.value(value: AllEventProvider()),
              ChangeNotifierProvider<CustomerProvider>.value(value: CustomerProvider()),
              ChangeNotifierProvider<ProductProvider>.value(value: ProductProvider()),
              ChangeNotifierProvider<NewTransactionProvider>.value(value: NewTransactionProvider()),
              ChangeNotifierProvider<NewQuotationProivder>.value(value: NewQuotationProivder()),
              ChangeNotifierProvider<AllQuotationProvider>.value(value: AllQuotationProvider()),
              ChangeNotifierProvider<CreateFolderProvider>.value(value: CreateFolderProvider()),
              ChangeNotifierProvider<FolderPageProvider>.value(value: FolderPageProvider()),
              ChangeNotifierProvider<CloudGalleryProvider>.value(value: CloudGalleryProvider()),
              ChangeNotifierProvider<AddCreditProvider>.value(value: AddCreditProvider()),
            ],
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Photography Manager',
              theme: ThemeData(
                buttonTheme: const ButtonThemeData(
                  buttonColor: Colors.indigo,
                ),
                primaryColor: Colors.indigo,
              ),
              routerDelegate: RoutemasterDelegate(routesBuilder: (context) {
                app.check();
              ;
                if (app.isLoggedin) {
         print('first raout');
                  return route;
                } else {
                  print('second raout');
                  return RouteMap(routes: {
                    '/': (route) => const MaterialPage(
                          child: LogIn(),
                        ),
                  });
                }
              }),
              routeInformationParser: const RoutemasterParser(),
            ),
          );
        });
  }
}
