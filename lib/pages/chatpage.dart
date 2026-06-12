import 'package:flutter/material.dart';
import 'package:phoenix/Utils/class/chatClass.dart';
import 'package:phoenix/Utils/helper/appbar.dart';
import 'package:phoenix/Utils/helper/chatBubble.dart';
import 'package:phoenix/Utils/providers/chatprovider.dart';
import 'package:phoenix/Utils/providers/userprovider.dart';
import 'package:phoenix/Utils/service/chatservice.dart';
import 'package:provider/provider.dart';

class Chatpage extends StatefulWidget {
  final String reseverid;
  const Chatpage({super.key, required this.reseverid});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  final Chatservice chatservice = Chatservice();
  final TextEditingController _messagecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<Chatprovider>();

      provider.loadChatHistory(widget.reseverid);

      Future.delayed(const Duration(seconds: 1), () {
        print('😂${provider.messages.length}');
      });

      chatservice.connect();

      chatservice.onmessage((Message msg) {
        if (msg.data != null) {
          provider.addMessage(msg.data!);
        }
      });
    });
  }

  void sendMessage() {
    final text = _messagecontroller.text.trim();
    if (text.isEmpty) return;

    final currentUser = context.read<Userprovider>().User;
    if (currentUser == null) return;

    final message = ChatMessage(
      id: null,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      roomId: widget.reseverid.toString(),
      userId: currentUser.Id.toString(),
      type: ChatMessageType.text,
      content: text,
    );

    // send to socket
    chatservice.sendmessage(message);

    // optimistic update
    context.read<Chatprovider>().addMessage(message);

    _messagecontroller.clear();
  }

  @override
  void dispose() {
    _messagecontroller.dispose();
    chatservice.socket.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final chatprovider = context.watch<Chatprovider>();
    final currentUser = context.read<Userprovider>().User;

    final messages = chatprovider.messages.reversed.toList();

    return Scaffold(
      appBar: appbar(width: MediaQuery.of(context).size.width),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];

                return ChatBuble(
                  text: msg.content,
                  time: msg.createdAt?.toString() ?? '',
                  sanderID: msg.userId,
                  currentuser: currentUser!,
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            color: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messagecontroller,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      filled: true,
                      fillColor: isDark ? Colors.grey.shade800 : Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
