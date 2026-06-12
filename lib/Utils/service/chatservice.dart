import 'package:phoenix/Utils/class/chatClass.dart';
import 'package:phoenix/Utils/service/ApiClient.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Chatservice {
  late IO.Socket socket;

  Future<List<ChatMessage>> getChatHistory(String roomId) async {
    try {
      final response = await Apiclient.dio.get(
        '/chat/v1/rooms/$roomId/history',
      );

      final data = response.data['data'] ?? [];

      return (data as List).map((e) => ChatMessage.fromJson(e)).toList();
    } catch (e) {
      print("History Error: $e");
      return [];
    }
  }

  Future<List<ChatMessage>> getallchat() async {
    try {
      final response = await Apiclient.dio.get('/chat/v1/rooms');
      print('😒${response.data}');
      if (response.statusCode == 200) {
        final data = response.data['chats'] as List;
        return data.map((chat) => ChatMessage.fromJson(chat)).toList();
      } else {
        throw Exception('Failed to load chat');
      }
    } catch (e) {
      print("Error during API call: $e");
      return [];
    }
  }

  void connect() {
    socket = IO.io(
      'ws://localhost:5000/chat/v1/connect',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .build(),
    );

    socket.connect();
  }

  // ✅ send Message wrapped correctly
  void sendmessage(ChatMessage message) {
    socket.emit('message', {'type': 'chat', 'data': message.toJson()});
  }

  // ✅ FIX: now returns Message (not ChatMessage directly)
  void onmessage(Function(Message message) callback) {
    socket.on('message', (data) {
      final msg = Message.fromJson(data);
      callback(msg);
    });
  }
}
