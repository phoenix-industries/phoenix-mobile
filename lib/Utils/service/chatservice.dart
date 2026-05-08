import 'package:phoenix/Utils/class/chatClass.dart';
import 'package:phoenix/Utils/service/ApiClient.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Chatservice {
  late IO.Socket socket;
   Future<List<Chatclass?>> getallchat() async {
    try {
      final response = await Apiclient.dio.get(
        '', //endpointchat
      );
      if (response.statusCode == 200) {
        List data = response.data['chats'];
        return data.map((chats) => Chatclass.fromJson(chats)).toList();
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
      '', //URL
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .build(),
    );

    socket.connect();
  }

  void sendmessage(Chatclass message) {
    socket.emit(
      '', //endpoint
      message.toJson(),
    );
  }

  void onmessage(Function(Chatclass message) callback) {
    socket.on(
      '', //endpoint
      (data) {
        final msg = Chatclass.fromJson(data);
        callback(msg);
      },
    );
  }
}
