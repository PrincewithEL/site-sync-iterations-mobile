import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/theme/app_pallete.dart';
import '../../../domain/entities/chatroom_response_entity.dart';

class MessageBubble extends StatelessWidget {
  final String currentUserType;
  final ChatMessagesEntity chatMessagesEntity;

  final Function(String, String)? onEdit;
  final Function(String)? onDelete;

  const MessageBubble({
    Key? key,
    this.onEdit,
    this.onDelete,
    required this.chatMessagesEntity,
    required this.currentUserType,
  }) : super(key: key);

  void _showOptionsModal(
      BuildContext context, String messageID, String message) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: AppPallete.backgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit, color: AppPallete.whiteColor),
              title: const Text(
                'Edit Message',
                style: TextStyle(color: AppPallete.whiteColor),
              ),
              onTap: () {
                Navigator.pop(context);
                _showEditDialog(context, messageID, message);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text(
                'Delete Message',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pop(context);
                _showDeleteConfirmation(context, messageID);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, String messageID, String message) {
    final TextEditingController controller =
        TextEditingController(text: message);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: AppPallete.backgroundColor,
        title: const Text(
          'Edit Message',
          style: TextStyle(color: AppPallete.whiteColor),
        ),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Type a message',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (onEdit != null) {
                onEdit!(messageID, controller.text);
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, String messageID) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppPallete.backgroundColor,
        title: const Text(
          'Delete Message',
          style: TextStyle(color: AppPallete.whiteColor),
        ),
        content: const Text(
          'Are you sure you want to delete this message?',
          style: TextStyle(color: AppPallete.whiteColor),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (onDelete != null) {
                onDelete!(messageID);
              }
              Navigator.pop(context);
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isMe = chatMessagesEntity.sender.toString() == currentUserType;
    final bool isRead = chatMessagesEntity.isRead ?? false;
    final bool isStarred = chatMessagesEntity.isStarred ?? false;
    final String message = chatMessagesEntity.message.toString();
    final String time = DateFormat('h:mm a').format(DateTime.parse(
      chatMessagesEntity.timestamp!,
    ));
    final String senderName = chatMessagesEntity.senderName.toString();
    final String messageID = chatMessagesEntity.id.toString();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: GestureDetector(
          onLongPress: isMe
              ? () => _showOptionsModal(context, messageID, message)
              : null,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              color: isMe ? Colors.white : Colors.grey[700],
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isMe)
                  Text(
                    senderName,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[300],
                    ),
                  ),
                const SizedBox(height: 5),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 16,
                    color: isMe
                        ? AppPallete.backgroundColor
                        : AppPallete.whiteColor,
                  ),
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Visibility(
                        visible: isMe && isStarred,
                        child: Icon(
                          Icons.star,
                          size: 14,
                          color: isMe && isStarred
                              ? AppPallete.yelloColor.withOpacity(1)
                              : AppPallete.greyColor
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 12,
                          color: isMe
                              ? AppPallete.backgroundColor.withOpacity(0.6)
                              : Colors.grey[300],
                        ),
                      ),
                      Visibility(
                        visible: isMe,
                        child: Icon(
                          Icons.check,
                          size: 14,
                          color: isMe && isRead
                              ? AppPallete.blueColor
                              : AppPallete.greyColor,
                        ),
                      ),
                      Visibility(
                        visible: isMe,
                        child: Icon(
                          Icons.check,
                          size: 14,
                          color: isMe && isRead
                              ? AppPallete.blueColor
                              : AppPallete.greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
