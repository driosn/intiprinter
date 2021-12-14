
import 'dart:async';

import 'package:flutter/services.dart';

class Intiprinter {
  static const MethodChannel _channel =
      const MethodChannel('intiprinter');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<void> imprimir(String texto, String mac) async {
    print('IMPRIMIR');
    try {
      final respuesta = await _channel.invokeMethod('imprimir_texto', [texto, mac]);
      if (respuesta == "OK") {
        return respuesta;
      }
    } on PlatformException {
      rethrow;
    }
  }
}
