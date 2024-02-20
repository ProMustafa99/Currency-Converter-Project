import 'package:currency_converter/Shared_Preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqlite_api.dart';

Widget InputUser(TextEditingController controller) {
  return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.menu),
        border: OutlineInputBorder(),
        hintText: 'Enter Name Task ',
      ));
}
void Tosta_mes({required String mess, Color? color}) => Fluttertoast.showToast(
    msg: mess,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 20,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0);

List <Map> listCrrany = [] ;

