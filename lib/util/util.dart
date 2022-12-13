// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:io';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

class Util {
  static capture(GlobalKey? key, String customer) async {
    if (key == null) {
      return null;
    } else {
      RenderRepaintBoundary? render = key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      final image = await render?.toImage(pixelRatio: 10);
      final byteDate = await image?.toByteData(format: ImageByteFormat.png);
      final pngByte = byteDate?.buffer.asUint8List();
      if (pngByte != null) {
        String? path = await FilePicker.platform.getDirectoryPath();
        if (path != null && path.isNotEmpty) {
          File file = await File('${path}/${customer}.png').create();
          file.writeAsBytesSync(pngByte);
        }
      }
    }
  }
}
