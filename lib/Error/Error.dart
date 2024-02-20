import 'package:currency_converter/Widget.dart';
import 'package:flutter/material.dart';

class ErrorHandler {
  final String Error;
  ErrorHandler(this.Error) {
    Tosta_mes(mess: Error.toString() ,color: Colors.red);
  }
}
