import 'package:dio/dio.dart';
import 'package:phoenix/Utils/class/chatsummery.dart';
import 'package:phoenix/Utils/service/ApiClient.dart';

class ChatSummaryService {
  Future<List<Chatsummery>> getAllChats() async {
    try {
      final response = await Apiclient.dio.get('/chat/v1/rooms');

      if (response.statusCode == 200) {
        final data = response.data['data'] ?? [];

        return (data as List)
            .map((chat) => Chatsummery.fromjson(chat))
            .toList();
      }

      return [];
    } on DioException catch (e) {
      print("Dio Error: ${e.message}");
      return [];
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}
