import 'package:flutter/material.dart';


class CustomDropdown<T> extends StatefulWidget {
  final List<T> items;
  final T? value;
  final ValueChanged<T?>? onChanged;

  CustomDropdown({required this.items, this.value, this.onChanged});

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}


class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  late T _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value ?? widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<T>(
        value: _selectedValue,
        onChanged: (newValue) {
          setState(() {
            _selectedValue = newValue!;
            widget.onChanged?.call(newValue);
          });
        },
        items: widget.items.map<DropdownMenuItem<T>>((T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
      ),
    );
  }
}
