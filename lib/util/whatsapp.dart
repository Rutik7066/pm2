import 'dart:io';

class Whatsapp {
  Future<void> createMessage({required String number, required String message}) async {
    print('invoked with ${message}');
    // Uri encodedMessage = Uri.parse(message);
    var startWhatsup = await Process.start('cmd', ['']);
    startWhatsup.stdin.writeln('start whatsapp://send?phone=91$number^&text=$message');
  }
}
// d