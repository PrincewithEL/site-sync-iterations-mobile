import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerInput extends StatefulWidget {
  final String? hint;
  final TextEditingController controller;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String dateFormat;
  final Function(DateTime)? onDateSelected;

  const DatePickerInput({
    Key? key,
    this.hint,
    required this.controller,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.dateFormat = 'yyyy-MM-dd',
    this.onDateSelected,
  }) : super(key: key);

  @override
  State<DatePickerInput> createState() => _DatePickerInputState();
}

class _DatePickerInputState extends State<DatePickerInput> {
  DateTime? _selectedDate;
  late DateFormat _dateFormatter;

  @override
  void initState() {
    super.initState();
    _dateFormatter = DateFormat(widget.dateFormat);
    if (widget.controller.text.isNotEmpty) {
      try {
        _selectedDate = _dateFormatter.parse(widget.controller.text);
      } catch (e) {
        debugPrint('Error parsing initial date: $e');
      }
    }
  }

  Future<void> _showDatePicker() async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? widget.initialDate ?? now,
      firstDate: widget.firstDate ?? DateTime(1900),
      lastDate: widget.lastDate ?? DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColor,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        widget.controller.text = _dateFormatter.format(picked);
      });
      widget.onDateSelected?.call(picked);
    }
  }

  void _clearSelection() {
    setState(() {
      _selectedDate = null;
      widget.controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          readOnly: true,
          validator: (value) {
            if (value!.isEmpty) {
              return "${widget.hint} is required!";
            }
            return null;
          },
          onTap: _showDatePicker,
          decoration: InputDecoration(
            hintText: widget.hint ?? 'Select date',
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_selectedDate != null)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: _clearSelection,
                  ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: _showDatePicker,
                ),
              ],
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}