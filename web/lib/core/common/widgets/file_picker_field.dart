import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerInput extends StatefulWidget {
  final String? hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(PlatformFile)? onFileSelected;

  const FilePickerInput({
    Key? key,
    this.hint,
    required this.controller,
    this.validator,
    this.onFileSelected,
  }) : super(key: key);

  @override
  State<FilePickerInput> createState() => _FilePickerInputState();
}

class _FilePickerInputState extends State<FilePickerInput> {
  PlatformFile? _selectedFile;

  void _showFilePickerOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            20,
          ),
        ),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Choose File Type',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.black
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildOptionTile(
                  icon: Icons.image,
                  label: 'Image',
                  onTap: () => _pickFile(FileType.image),
                ),
                _buildOptionTile(
                  icon: Icons.video_library,
                  label: 'Video',
                  onTap: () => _pickFile(FileType.video),
                ),
                _buildOptionTile(
                  icon: Icons.audiotrack,
                  label: 'Audio',
                  onTap: () => _pickFile(FileType.audio),
                ),
                _buildOptionTile(
                  icon: Icons.description,
                  label: 'Document',
                  onTap: () => _pickFile(FileType.any),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: 32,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Future<void> _pickFile(FileType fileType) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: fileType,
        allowMultiple: false,
      );

      if (result != null) {
        setState(() {
          _selectedFile = result.files.first;
          widget.controller.text = _selectedFile!.path ?? '';
          if (widget.onFileSelected != null) {
            widget.onFileSelected!(_selectedFile!);
          }
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error picking file: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  String _getFileTypeLabel() {
    if (_selectedFile == null) return '';

    final extension = _selectedFile!.extension?.toLowerCase() ?? '';

    if (['jpg', 'jpeg', 'png', 'gif'].contains(extension)) {
      return 'Image';
    } else if (['mp4', 'mov', 'avi'].contains(extension)) {
      return 'Video';
    } else if (['mp3', 'wav', 'm4a'].contains(extension)) {
      return 'Audio';
    } else if (['pdf', 'doc', 'docx', 'txt'].contains(extension)) {
      return 'Document';
    } else {
      return 'File';
    }
  }

  IconData _getFileIcon() {
    if (_selectedFile == null) return Icons.attach_file;

    final extension = _selectedFile!.extension?.toLowerCase() ?? '';

    if (['jpg', 'jpeg', 'png', 'gif'].contains(extension)) {
      return Icons.image;
    } else if (['mp4', 'mov', 'avi'].contains(extension)) {
      return Icons.video_library;
    } else if (['mp3', 'wav', 'm4a'].contains(extension)) {
      return Icons.audiotrack;
    } else if (['pdf', 'doc', 'docx', 'txt'].contains(extension)) {
      return Icons.description;
    } else {
      return Icons.insert_drive_file;
    }
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
          onTap: _showFilePickerOptions,
          decoration: InputDecoration(
            hintText: widget.hint ?? 'Select a file',
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_selectedFile != null) ...[
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        _selectedFile = null;
                        widget.controller.clear();
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      '${(_selectedFile!.size / 1024 / 1024).toStringAsFixed(2)} MB',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
                IconButton(
                  icon: Icon(_getFileIcon()),
                  onPressed: _showFilePickerOptions,
                ),
              ],
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Theme.of(context).dividerColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
        if (_selectedFile != null) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                _getFileIcon(),
                size: 16,
                color: Theme.of(context).textTheme.bodySmall?.color,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  '${_getFileTypeLabel()}: ${_selectedFile!.name}',
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
