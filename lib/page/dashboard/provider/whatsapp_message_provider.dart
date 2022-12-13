import 'package:flutter/material.dart';
import 'package:pm/model/whatsapp_temp_modal.dart';

class WhatsappMessageProvider extends ChangeNotifier {
  String number = '';
  var modal;
  chnageModal(wm) {
    modal = wm;
    notifyListeners();
    print(modal);
  }

  clear() {
    number = '';
    modal = null;
    notifyListeners();
    print(modal);
  }
}
