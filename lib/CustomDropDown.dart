import 'package:flutter/material.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
        value: selectedValue,
        onChanged: (val) {
          setState(() {
            selectedValue = val;
          });
          widget.onChanged?.call(val); // Call the onChanged callback if provided
        },
        items: widget.listCrrauncy.map((e) => DropdownMenuItem(
          child: Text("$e"),
          value: e,
        )).toList(),
      ),
    );
  }
}
