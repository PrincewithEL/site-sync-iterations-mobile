import 'package:flutter/material.dart';
import 'package:site_sync/core/theme/app_pallete.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String hint;
  final void Function(String?) onChanged;

  const CustomDropdown({super.key,
    required this.items,
    required this.hint,
    required this.onChanged,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedItem,
          hint: Text(widget.hint),
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down, color: AppPallete.errorColor),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: AppPallete.whiteColor, fontSize: 16),
          onChanged: (String? newValue) {
            setState(() {
              _selectedItem = newValue;
            });
            widget.onChanged(newValue);
          },
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}