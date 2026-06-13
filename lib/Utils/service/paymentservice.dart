import 'package:dio/dio.dart';
import 'package:phoenix/Utils/service/ApiClient.dart';

class PaymentService {
  Future<String?> confirmPayment(Map<String, dynamic> body) async {
    try {
      final response = await Apiclient.dio.post(
        '/api/v1/products/buy',
        data: body,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      final data = response.data;

      // 🔥 تأكد إنه Map
      if (data is Map<String, dynamic>) {
        if (data['ok'] == true) {
          return null; // success
        } else {
          return data['error']?.toString() ?? 'Unknown error';
        }
      }

      return 'Invalid response format';
    } catch (e) {
      print('😁$e');
      return e.toString();
    }
  }
}
