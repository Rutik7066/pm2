import 'dart:io';

import 'package:isar/isar.dart';
import 'package:pm/model/bill_modal.dart';
import 'package:pm/model/cart_item.dart';
import 'package:pm/model/celebration_modal.dart';
import 'package:pm/model/customer_modal.dart';
import 'package:pm/model/event_modal.dart';
import 'package:pm/model/job_image_modal.dart';
import 'package:pm/model/job_modal.dart';
import 'package:pm/model/product_modal.dart';
import 'package:pm/model/expense_modal.dart';
import 'package:pm/model/quotation_modal.dart';
import 'package:pm/model/transaction_modal.dart';
import 'package:pm/model/daily_modal.dart';
import 'package:pm/model/whatsapp_temp_modal.dart';

Future<Isar> openDb() async {
  if (Isar.instanceNames.isEmpty) {
    return  Isar.open(
      [
        BillModalSchema,
        ProductModalSchema,
        CustomerModalSchema,
        CartItemSchema,
        EventModalSchema,
        ExpenseModalSchema,
        TransactionModalSchema,
        QuotationModalSchema,
        CelebrationModalSchema,
        JobModalSchema,
        JobImageModalSchema,
        DailyModalSchema,
        WhatsappModalSchema
      ],
      directory: Directory.current.path,
      inspector: true,
      relaxedDurability: true,
      name: 'K', 
    );
  } else {
    return  Future.value(
      Isar.getInstance(
        'K',
      ),
    );
  }
}
