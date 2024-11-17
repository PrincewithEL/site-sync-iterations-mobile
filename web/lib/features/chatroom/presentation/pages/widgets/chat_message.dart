import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/search_message_response_entity.dart';

class ChatMessage extends StatelessWidget {
  final SearchMessagesEntity messageData;

  const ChatMessage({
    Key? key,
    required this.messageData,
  }) : super(key: key);

  String _formatTime(String timestamp) {
    final DateTime dateTime = DateTime.parse(timestamp);
    return DateFormat('HH:mm').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Picture
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "https://site-sync-iterations.onrender.com/${messageData.senderUser!.profilePicture ?? ""}",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.person, color: Colors.grey);
                },
              ),
            ),
          ),

          // Message Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header Row (Name and Time)
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        messageData.senderUser!.firstName ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      _formatTime(messageData.timestamp ?? ""),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                // Message Text
                const SizedBox(height: 4),
                Text(
                  messageData.message ?? "",
                  style: const TextStyle(fontSize: 15),
                ),

                // Message Status
                const SizedBox(height: 4),
                Row(
                  children: [
                    if (messageData.isBookmarked ?? false)
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.bookmark, size: 12, color: Colors.grey[600]),
                            const SizedBox(width: 2),
                            Text(
                              'Bookmarked',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (messageData.updatedAt != null)
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: Text(
                          'Edited',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    if (messageData.readStatus!.isNotEmpty)
                      Text(
                        'Read',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
