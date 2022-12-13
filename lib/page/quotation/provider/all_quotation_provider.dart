import 'package:flutter/material.dart';
import 'package:pm/db/qotation_repo.dart';
import 'package:pm/model/quotation_modal.dart';

class AllQuotationProvider extends ChangeNotifier {
  String? filter;

  chnageFilter(String? v) {
    filter = v;
    notifyListeners();
  }

  Stream<List<QuotationModal>> listenToQuotes() async* {
    if (filter != null) {
      yield* QuotationRepo().listenToQuote(filter!);
    } else {
      yield* QuotationRepo().listenToQuotation();
    }
  }
}
