import 'package:currency_converter/Style/Style.dart';
import 'package:currency_converter/Widget.dart';
import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  final List<dynamic> listCurrency;
  final Function(dynamic)? onChanged;

  const DropDownMenu(this.listCurrency, {super.key, this.onChanged});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {

  late dynamic selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.listCurrency.isNotEmpty ? widget.listCurrency.first: null;
    Base_Currency = To_Currency = selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
        menuMaxHeight: MediaQuery.of(context).size.height * 0.4,
        isExpanded: true,
        hint: const Text("Select currency",style: AppTextStyles.bodyTextStyle),
        value: selectedValue,
        onChanged: (val) {
          setState(() {
            selectedValue = val;
          });
          widget.onChanged?.call(val); // Call the onChanged callback if provided
        },
        items: widget.listCurrency.map((e) => DropdownMenuItem(
          value: e,
          child: Text("$e" ,style: AppTextStyles.bodyTextStyle),
        )).toList(),
      ),
    );
  }
}


