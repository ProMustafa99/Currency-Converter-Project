import 'package:currency_converter/Widget.dart';
import 'package:flutter/material.dart';


class ErrorHandler {
  final String Error;
  ErrorHandler(this.Error) {
    Tosta_mes(mess: Error.toString() ,color: Colors.red);
  }
}

class HttpError {
  static getMessage(int statusCode) {

    switch (statusCode) {
      case 401:
        Tosta_mes(mess: "Unauthorized: You are not authorized to access this resource." ,color: Colors.red);
      case 403:
        Tosta_mes(mess: "Forbidden: Access to this resource is forbidden.." ,color: Colors.red);
      case 404:
        Tosta_mes(mess: "Not Found: The requested resource was not found." ,color: Colors.red);
      default:
        Tosta_mes(mess: "Error $statusCode: An error occurred while fetching data.'" ,color: Colors.red);
    }
  }
}