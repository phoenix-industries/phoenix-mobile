import 'package:flutter/material.dart';
import 'package:phoenix/Utils/class/chatClass.dart';
import 'package:phoenix/Utils/helper/appbar.dart';
import 'package:phoenix/Utils/helper/chatBubble.dart';
import 'package:phoenix/Utils/providers/chatprovider.dart';
import 'package:phoenix/Utils/providers/userprovider.dart';
import 'package:phoenix/Utils/service/chatservice.dart';
import 'package:provider/provider.dart';

class Chatpage extends StatefulWidget {
  final int reseverid;
  const Chatpage({super.key, required this.reseverid});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  Chatservice chatservice = Chatservice();
  final TextEditingController _messagecontroller = TextEditingController();
  int? chatId;
  @override
  void initState() {
    super.initState();

    final provider = context.read<Chatprovider>();

    provider.loadAllChat();
    chatservice.connect();
    chatservice.onmessage((msg) {
      if (chatId == null) {
        chatId = msg.ChatId;
      }
      provider.addMessage(msg);
    });
  }

  void sendMessage() {
    final text = _messagecontroller.text.trim();
    if (text.isEmpty) return;
    final currentuser = context.read<Userprovider>().User!;
    final message = Chatclass(
      ChatId: chatId ?? 0,
      reseverId: widget.reseverid,
      senderId: currentuser.Id,
      massageId: 0,
      text: text,
      timenow: DateTime.now(),
    );
    chatservice.sendmessage(message);
    context.read<Chatprovider>().addMessage(message);
    _messagecontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final chatprovider = context.watch<Chatprovider>();
    final currentuser = context.read<Userprovider>().User!;
    return Scaffold(
      appBar: appbar(width: width),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: chatprovider.messages.length,
              itemBuilder: (context, index) {
                final msg = chatprovider
                    .messages[chatprovider.messages.length - 1 - index];
                return ChatBuble(
                  text: msg!.text,
                  time: msg.timenow.toString(),
                  sanderID: msg.senderId,
                  currentuser: currentuser,
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            color: Colors.grey.shade100,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messagecontroller,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
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
