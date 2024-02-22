import 'dart:convert';

import 'package:currency_converter/Error/Error.dart';
import 'package:currency_converter/Styel/styel.dart';
import 'package:currency_converter/Widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DropDowmmenu extends StatefulWidget {
  final List<dynamic> listCrrauncy;
  final Function(dynamic)? onChanged;

  DropDowmmenu(this.listCrrauncy, {this.onChanged});

  @override
  State<DropDowmmenu> createState() => _DropDowmmenuState();
}

class _DropDowmmenuState extends State<DropDowmmenu> {

  late dynamic selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.listCrrauncy.isNotEmpty ? widget.listCrrauncy.first: null;
    Base_Currency = To_Currency = selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
        hint: Text("Select currency",style: AppTextStyles.bodyTextStyle),
        value: selectedValue,
        onChanged: (val) {
          setState(() {
            selectedValue = val;
          });
          widget.onChanged?.call(val); // Call the onChanged callback if provided
        },
        items: widget.listCrrauncy.map((e) => DropdownMenuItem(
          child: Text("$e" ,style: AppTextStyles.bodyTextStyle),
          value: e,
        )).toList(),
      ),
    );
  }
}


