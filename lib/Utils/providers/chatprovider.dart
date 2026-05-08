import 'package:flutter/material.dart';
import 'package:phoenix/Utils/class/chatClass.dart';
import 'package:phoenix/Utils/service/chatservice.dart';

class Chatprovider extends ChangeNotifier {
  final Chatservice _chatservice = Chatservice();
  bool isloading = false;
  List<Chatclass?> messages = [];

  Future<void> loadAllChat() async {
    isloading = true;
    notifyListeners();
    final data = await _chatservice.getallchat();
    messages = data;
    isloading = false;
    notifyListeners();
  }

  void addMessage(Chatclass message) {
    messages.add(message);
    notifyListeners();
  }
}
