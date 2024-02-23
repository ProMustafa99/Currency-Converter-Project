import 'package:currency_converter/Global/Variable/variable.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    selectedValue = widget.listCurrency.first;
    Base_Currency = To_Currency = selectedValue;
    print("From Custom Menu Page ${listCrrany}");

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
        menuMaxHeight: MediaQuery.of(context).size.height * 0.4,
        isExpanded: true,
        value:selectedValue,
        onChanged: (val) {
          setState(() {
            selectedValue = val;
            print("val ${val} ************************* ");
          });
          widget.onChanged?.call(val); // Call the onChanged callback if provided
        },
        items:widget.listCurrency.map((e) => DropdownMenuItem(
          value:e,
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: "https://flagcdn.com/16x12/${e.toString().toLowerCase().substring(0,2)}.png",
                errorWidget: (context, url, error) => Icon(Icons.flag),
              ),
               const SizedBox(width: 7,),
               Text("${e}")
            ],
          )
        )).toList(),
      ),
    );
  }
}


