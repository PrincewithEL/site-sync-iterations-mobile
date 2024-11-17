import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePickerInput extends StatefulWidget {
  final String? hint;
  final TextEditingController controller;
  final TimeOfDay? initialTime;
  final String timeFormat;
  final Function(TimeOfDay)? onTimeSelected;

  const TimePickerInput({
    Key? key,
    this.hint,
    required this.controller,
    this.initialTime,
    this.timeFormat = 'HH:mm',
    this.onTimeSelected,
  }) : super(key: key);

  @override
  State<TimePickerInput> createState() => _TimePickerInputState();
}

class _TimePickerInputState extends State<TimePickerInput> {
  TimeOfDay? _selectedTime;
  late DateFormat _timeFormatter;

  @override
  void initState() {
    super.initState();
    _timeFormatter = DateFormat(widget.timeFormat);
    if (widget.controller.text.isNotEmpty) {
      try {
        // Parse the time string to TimeOfDay
        final DateTime dateTime = _timeFormatter.parse(widget.controller.text);
        _selectedTime = TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
      } catch (e) {
        debugPrint('Error parsing initial time: $e');
      }
    }
  }

  Future<void> _showTimePicker() async {
    final TimeOfDay now = TimeOfDay.now();
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? widget.initialTime ?? now,
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
        _selectedTime = picked;
        // Convert TimeOfDay to formatted string
        final now = DateTime.now();
        final dateTime = DateTime(
          now.year,
          now.month,
          now.day,
          picked.hour,
          picked.minute,
        );
        widget.controller.text = _timeFormatter.format(dateTime);
      });
      widget.onTimeSelected?.call(picked);
    }
  }

  void _clearSelection() {
    setState(() {
      _selectedTime = null;
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
          onTap: _showTimePicker,
          decoration: InputDecoration(
            hintText: widget.hint ?? 'Select time',
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_selectedTime != null)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: _clearSelection,
                  ),
                IconButton(
                  icon: const Icon(Icons.access_time),
                  onPressed: _showTimePicker,
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