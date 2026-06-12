import 'package:flutter/material.dart';
import 'package:phoenix/Utils/class/chatClass.dart';
import 'package:phoenix/Utils/class/chatsummery.dart';
import 'package:phoenix/Utils/service/chatservice.dart';

class Chatprovider extends ChangeNotifier {
  final Chatservice _chatservice = Chatservice();

  bool isloading = false;

  List<ChatMessage> messages = [];
  List<Chatsummery> rooms = [];

  Future<void> loadChatHistory(String roomId) async {
    isloading = true;
    notifyListeners();

    try {
      messages = await _chatservice.getChatHistory(roomId);
    } catch (e) {
      print("loadChatHistory error: $e");
      messages = [];
    }

    isloading = false;
    notifyListeners();
  }

  void addMessage(ChatMessage message) {
    messages.add(message);
    notifyListeners();
  }

  void clear() {
    messages.clear();
    notifyListeners();
  }
}
