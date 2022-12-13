import 'package:flutter/material.dart';
import 'package:pm/db/customer_repo.dart';
import 'package:pm/model/customer_modal.dart';

class CustomerProvider extends ChangeNotifier {
  String? filter;

  setfilter({ String? filter}) {
    this.filter = filter;
    notifyListeners();
  }

  Stream<List<CustomerModal>> getStreamedCustomer() async* {
    if (filter != null) {
      yield* CustomerRepo().filterCustomer(name: filter!);
    } else {
      yield* CustomerRepo().listenTocustomer();
    }
  }
}
