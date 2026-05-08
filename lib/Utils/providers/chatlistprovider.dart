import 'package:flutter/material.dart';
import 'package:phoenix/Utils/class/chatsummery.dart';
import 'package:phoenix/Utils/service/chatListservice.dart';

class ChatListProvider extends ChangeNotifier {
  final ChatSummaryService _service = ChatSummaryService();

  bool isLoading = false;

  List<Chatsummery> chats = [];

  Future<void> loadChats() async {
    isLoading = true;
    notifyListeners();

    chats = await _service.getAllChats();

    isLoading = false;
    notifyListeners();
  }
}
