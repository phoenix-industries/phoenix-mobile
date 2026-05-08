import 'package:dio/dio.dart';
import 'package:phoenix/Utils/class/chatsummery.dart';
import 'package:phoenix/Utils/service/ApiClient.dart';

class ChatSummaryService {

  Future<List<Chatsummery>> getAllChats() async {
    try {
      final response = await Apiclient.dio.get('/chats');

      if (response.statusCode == 200) {
        List data = response.data;

        return data
            .map((chat) => Chatsummery.fromjson(chat))
            .toList();
      } else {
        throw Exception('Failed to load chats');
      }
    } on DioException catch (e) {
      print("Dio Error: ${e.message}");
      return [];
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}