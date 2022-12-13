import 'package:flutter/material.dart';
import 'package:pm/home/home.dart';
import 'package:pm/page/bill/all_bill.dart';
import 'package:pm/page/bill/bill.dart';
import 'package:pm/page/bill/bill_page.dart';
import 'package:pm/page/bill/create_bill.dart';
import 'package:pm/page/event/all_event.dart';
import 'package:pm/page/photo_gallery/create_folder.dart';
import 'package:pm/page/photo_gallery/folder_page.dart';
import 'package:pm/page/photo_gallery/photo_gallery.dart';
import 'package:pm/page/credit_management/credit_management.dart';
import 'package:pm/page/credit_management/customer_credit_page.dart';
import 'package:pm/page/customer/customer.dart';
import 'package:pm/page/dashboard/dashborad.dart';
import 'package:pm/page/event/calender.dart';
import 'package:pm/page/whatsapp/celebration.dart';
import 'package:pm/page/whatsapp/recovery.dart';
import 'package:pm/page/whatsapp/whatsapp.dart';
import 'package:pm/page/event/create_event.dart';

import 'package:pm/page/event/event.dart';
import 'package:pm/page/event/event_page.dart';
import 'package:pm/page/expense/expense.dart';
import 'package:pm/page/product/product.dart';
import 'package:pm/page/profile/profile.dart';
import 'package:pm/page/quotation/all_quotation.dart';
import 'package:pm/page/quotation/new_quotation.dart';
import 'package:pm/page/quotation/quotation.dart';
import 'package:pm/page/whatsapp/whatsapp_template.dart';
import 'package:routemaster/routemaster.dart';
///////////////////////////////////////////////////////////////

final route = RouteMap(routes: {
  '/': (_) => const IndexedPage(
        child: Home(),
        paths: [
          '/bill',
          '/event',
          '/creditmanagement',
          '/quotation',
          '/customer',
          '/couldgallery',
          '/product',
          '/expense',
          '/whatsapp',
          '/dashboard',
          '/profile',
        ],
      ),
////////////////////////////////////////////////////////////////////////
  '/bill': (_) => const TabPage(
        child: Bill(),
        paths: [
          'createbill',
          'allbill',
        ],
      ),
  '/bill/createbill': (_) => const MaterialPage(child: CreateBill()),
  '/bill/allbill': (_) => const MaterialPage(child: ALlBill()),
  '/bill/allbill/billpage': (_) => const MaterialPage(child: BillPage()),
////////////////////////////////////////////////////////////////////////
  '/event': (_) => const TabPage(
        child: Event(),
        paths: [
          'allevent',
          'calender',
          'createevent',
      
        ],
      ),
  '/event/createevent': (_) => const MaterialPage(child: CreateEvent()),
  '/event/allevent': (_) => const MaterialPage(child: AllEvent()),
  '/event/calender': (_) => const MaterialPage(child: Calender()),

  '/event/calender/eventpage': (r) => const MaterialPage(child: EventPage()),
  '/event/allevent/eventpage': (r) => const MaterialPage(child: EventPage()),

////////////////////////////////////////////////////////////////////////
  '/creditmanagement': (_) => const MaterialPage(child: CreditManagement()),
  '/creditmanagement/customercreditpage': (_) => const MaterialPage(child: CustomerCreditPage()),

////////////////////////////////////////////////////////////////////////
  '/quotation': (_) => const TabPage(
        child: Quotation(),
        paths: [
          'allquotation',
          'newquotation',
        ],
      ),

  '/quotation/allquotation': (_) => const MaterialPage(child: AllQuotation()),
  '/quotation/newquotation': (_) => const MaterialPage(child: NewQuotation()),

////////////////////////////////////////////////////////////////////////

  '/customer': (_) => const MaterialPage(child: Customer()),
////////////////////////////////////////////////////////////////////////

  '/couldgallery': (_) => const MaterialPage(child: PhotoGallery()),
  '/couldgallery/folderpage': (_) => const MaterialPage(child: FolderPage()),

  '/couldgallery/createfolder': (_) => const MaterialPage(child: CreateFolder()),
////////////////////////////////////////////////////////////////////////

  '/expense': (_) => const MaterialPage(child: Expense()),
////////////////////////////////////////////////////////////////////////
  '/whatsapp': (_) => const TabPage(child: Whatsapp(),paths: [
    "recovery",
    'celebration',
    'whatsapptemplate'
  ]),
  '/whatsapp/recovery': (_) => const MaterialPage(child: Recovery()),
  '/whatsapp/celebration': (_) => const MaterialPage(child: Celebration()),
  '/whatsapp/whatsapptemplate': (_) => const MaterialPage(child: WhatsappTemplate()),
////////////////////////////////////////////////////////////////////////

  '/product': (_) => const MaterialPage(child: Product()),
////////////////////////////////////////////////////////////////////////

  '/dashboard': (_) => const MaterialPage(child: Dashboard()),
////////////////////////////////////////////////////////////////////////
  '/profile': (route) => const MaterialPage(child: Profile()),
});
