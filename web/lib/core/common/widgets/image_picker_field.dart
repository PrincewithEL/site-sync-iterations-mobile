import 'package:flutter/material.dart';

import 'custom_image_picker.dart';

class ImagePickerInput extends StatefulWidget {
  final String? hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const ImagePickerInput({
    Key? key,
    this.hint,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  State<ImagePickerInput> createState() => _ImagePickerInputState();
}

class _ImagePickerInputState extends State<ImagePickerInput> {
  String? _imagePath;

  void _showImagePicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomImagePickerSheet(
        onImageSelected: (String path, String fileName) {
          widget.controller.text = path;
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          readOnly: true,
          validator: widget.validator,
          decoration: InputDecoration(
            hintText: widget.hint ?? 'Select an image',
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_imagePath != null)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        _imagePath = null;
                        widget.controller.clear();
                      });
                    },
                  ),
                IconButton(
                  icon: const Icon(Icons.image),
                  onPressed: _showImagePicker,
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
