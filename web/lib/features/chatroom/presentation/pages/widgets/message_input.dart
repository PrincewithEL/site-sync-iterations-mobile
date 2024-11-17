import 'package:flutter/material.dart';
import 'package:site_sync/core/common/widgets/loader.dart';
import 'package:site_sync/core/utils/contextual_components.dart';

class MessageInput extends StatefulWidget {
  final bool messageLoading;
  final Function(String) onPressed;

  const MessageInput({
    Key? key,
    required this.onPressed,
    this.messageLoading = false,
  }) : super(key: key);

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    widget.onPressed(messageController.text);
    messageController.clear(); // Clear the text field after sending
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ),
          widget.messageLoading
              ? Container(
            margin: const EdgeInsets.all(10.0),
            child: const Loader(),
          )
              : IconButton(
            icon: const Icon(Icons.send),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}
