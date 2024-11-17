import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:site_sync/core/theme/app_pallete.dart';
import 'package:site_sync/features/chatroom/domain/entities/search_message_response_entity.dart';
import 'package:site_sync/features/chatroom/presentation/bloc/chatroom_bloc.dart';
import 'package:site_sync/features/chatroom/presentation/pages/widgets/chat_message.dart';
import 'package:site_sync/features/chatroom/presentation/pages/widgets/message_bubble.dart';
import 'package:site_sync/features/chatroom/presentation/pages/widgets/message_input.dart';

import '../../../../core/common/widgets/loader.dart';
import '../../../../core/utils/contextual_components.dart';
import '../../../dashboard/presentation/widgets/empty_component.dart';
import '../../domain/entities/chatroom_response_entity.dart';

class ChatRoomPage extends StatefulWidget {
  static route(final String projectId) => MaterialPageRoute(
        builder: (context) => ChatRoomPage(
          projectId: projectId,
        ),
      );

  final String projectId;

  const ChatRoomPage({super.key, required this.projectId});

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final _formKey = GlobalKey<FormState>();
  Timer? _timer;
  int interval = 20;
  List<ChatMessagesEntity>? chatMessages;
  String? currentUserId;
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  bool _isSearchBarVisible = false;

  @override
  void initState() {
    super.initState();
    context.read<ChatroomBloc>().add(ViewChatroom(projectId: widget.projectId));
    startTimer(interval);
  }

  void startTimer(int seconds) {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: seconds), (timer) {
      if (mounted) {
        context
            .read<ChatroomBloc>()
            .add(ViewPollingChatroom(projectId: widget.projectId));
      }
    });
  }

  void _updateChatMessages(
      List<ChatMessagesEntity> newMessages, String userId) {
    context
        .read<ChatroomBloc>()
        .add(UpdateChatMessages(messages: newMessages, userId: userId));

    if (_scrollController.hasClients && chatMessages!.isNotEmpty) {
      _scrollController.animateTo(
        0, // Since ListView is reversed, 0 is the bottom
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  Map<String, List<ChatMessagesEntity>> groupMessagesByDate(
      List<ChatMessagesEntity> messages) {
    final Map<String, List<ChatMessagesEntity>> groupedMessages = {};

    for (var message in messages) {
      final date =
          DateFormat('yyyy-MM-dd').format(DateTime.parse(message.timestamp!));

      if (groupedMessages.containsKey(date)) {
        groupedMessages[date]!.add(message);
      } else {
        groupedMessages[date] = [message];
      }
    }

    return groupedMessages;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _showOptionsMenu(BuildContext context) {
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
              leading: const Icon(Icons.info, color: AppPallete.whiteColor),
              title: const Text(
                'Group Info',
                style: TextStyle(color: AppPallete.whiteColor),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: const Icon(Icons.search, color: AppPallete.whiteColor),
              title: const Text(
                'Search',
                style: TextStyle(color: AppPallete.whiteColor),
              ),
              onTap: () {
                setState(() {
                  _isSearchBarVisible = true;
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppPallete.whiteColor),
              title: const Text(
                'Settings',
                style: TextStyle(color: AppPallete.whiteColor),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSearchResponse(BuildContext context, List<SearchMessagesEntity>? messages) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5, // Limit max height to 50%
      ),
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: AppPallete.backgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            // Messages list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                itemCount: messages?.length ?? 0,
                itemBuilder: (context, index) {
                  return ChatMessage(messageData: messages![index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPallete.errorColor,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              _showOptionsMenu(context);
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: AppPallete.errorColor,
                ),
                child: _isSearchBarVisible
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isSearchBarVisible = false;
                                });
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: AppPallete.backgroundColor,
                              ),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                context.read<ChatroomBloc>().add(
                                      SearchMessage(
                                        projectId: widget.projectId,
                                        message: searchController.text.trim(),
                                      ),
                                    );
                              },
                              child: const Icon(
                                Icons.search,
                                color: AppPallete.backgroundColor,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            _timer?.cancel();
                          },
                        ),
                      )
                    : Container()),
            Expanded(
              child: BlocConsumer<ChatroomBloc, ChatroomState>(
                listener: (context, state) {
                  if (state is ViewChatroomFailure) {
                    showSnackBar(context, state.message);
                  }

                  if (state is SendMessageFailure) {
                    showSnackBar(context, state.message);
                  }

                  if (state is SendMessageLoading) {
                    _isLoading = true;
                  }

                  if (state is SendMessageSuccess) {
                    _isLoading = true;
                    startTimer(1);
                  }

                  if (state is EditMessageSuccess) {
                    showSnackBar(context, state.response.message ?? "");
                  }

                  if (state is DeleteMessageSuccess) {
                    showSnackBar(context, state.response.message ?? "");
                  }

                  if (state is EditMessageFailure) {
                    showSnackBar(context, state.message);
                  }

                  if (state is ViewPollingChatroomSuccess) {
                    _isLoading = false;
                    _updateChatMessages(
                      state.response.data?.chatMessages ?? [],
                      state.currentUserId,
                    );
                  }

                  if (state is SearchMessageSuccess) {
                    _showSearchResponse(context, state.response.messages);
                  }

                  if (state is ChatMessagesUpdated) {
                    chatMessages = state.chatMessages;
                    currentUserId = state.currentUserId;
                  }

                  // Update messages when receiving initial data
                  if (state is ViewChatroomSuccess) {
                    _updateChatMessages(
                      state.response.data?.chatMessages ?? [],
                      state.currentUserId,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ViewChatroomLoading) {
                    return const Center(
                      child: Loader(),
                    );
                  }

                  if (state is ViewChatroomFailure) {
                    return const EmptyComponent(subject: "chat");
                  }

                  if (chatMessages == null || chatMessages!.isEmpty) {
                    return const EmptyComponent(subject: "chats");
                  } else {
                    final groupedMessages = groupMessagesByDate(chatMessages!);

                    return ListView.builder(
                      controller: _scrollController,
                      reverse: true,
                      itemCount: groupedMessages.keys.length,
                      itemBuilder: (context, index) {
                        if (index < groupedMessages.keys.length) {
                          final dates = groupedMessages.keys.toList()
                            ..sort((a, b) => DateTime.parse(b).compareTo(DateTime.parse(a)));

                          final dateKey = dates[index];
                          final dateMessages = groupedMessages[dateKey]!;

                          dateMessages.sort((a, b) =>
                              DateTime.now().compareTo(DateTime.parse(a.timestamp!)));


                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Center(
                                  child: Text(
                                    DateFormat('EEEE, MMM d, yyyy')
                                        .format(DateTime.parse(dateKey)),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: AppPallete.greyColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              ...dateMessages.map((message) {
                                return MessageBubble(
                                  currentUserType: currentUserId!,
                                  chatMessagesEntity: message,
                                  onDelete: (messageID) {
                                    context.read<ChatroomBloc>().add(
                                          DeleteMessage(
                                            projectId: widget.projectId,
                                            messageId: messageID,
                                          ),
                                        );
                                  },
                                  onEdit: (messageID, message) {
                                    context.read<ChatroomBloc>().add(
                                          EditMessage(
                                            projectId: widget.projectId,
                                            messageId: messageID,
                                            editedMessage: message,
                                          ),
                                        );
                                  },
                                );
                              }).toList(),
                            ],
                          );
                        }
                      },
                    );
                  }
                },
              ),
            ),
            MessageInput(
              messageLoading: _isLoading,
              onPressed: (value) {
                if (_formKey.currentState!.validate()) {
                  context.read<ChatroomBloc>().add(
                        SendMessage(
                          projectId: widget.projectId,
                          message: value,
                          replyId: '',
                        ),
                      );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
