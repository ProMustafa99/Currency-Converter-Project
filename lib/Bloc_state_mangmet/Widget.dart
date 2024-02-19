import 'package:flutter/material.dart';

Widget InputUser(TextEditingController controller) {
  return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.menu),
        border: OutlineInputBorder(),
        hintText: 'Enter Name Task ',
      ));
}
