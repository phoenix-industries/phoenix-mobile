import 'package:flutter/material.dart';
import 'package:phoenix/Utils/helper/appbar.dart';
import 'package:phoenix/Utils/helper/chatsummeybubble.dart';
import 'package:phoenix/Utils/providers/chatlistprovider.dart';
import 'package:provider/provider.dart';

class Chatlistpage extends StatefulWidget {
  const Chatlistpage({super.key});

  @override
  State<Chatlistpage> createState() => _ChatlistpageState();
}

class _ChatlistpageState extends State<Chatlistpage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ChatListProvider>().loadChats();
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final listprovider = context.watch<ChatListProvider>();
    return Scaffold(
      appBar: appbar(width: width),
      body: listprovider.isLoading
          ? Center(child: CircularProgressIndicator())
          : listprovider.chats.isEmpty
          ? Center(
              child: Text(
                'No chats yet',
                style: TextStyle(color: Color(0xfff43f06), fontSize: 25),
              ),
            )
          : ListView.builder(
              itemCount: listprovider.chats.length,
              itemBuilder: (context, index) {
                final chats = listprovider.chats[index];
                return Chatsummeybubble(
                  chatsummery: chats,
                  ontap: () {
                    Navigator.pushNamed(
                      context,
                      '/chatpage',
                      arguments: chats.chatId,
                    );
                  },
                );
              },
            ),
    );
  }
}
