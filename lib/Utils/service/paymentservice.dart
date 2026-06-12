import 'package:dio/dio.dart';
import 'package:phoenix/Utils/service/ApiClient.dart';

class PaymentService {
  Future<bool> confirmPayment(Map<String, dynamic> body) async {
    try {
      final response = await Apiclient.dio.post(
        '/payment', // endpoint
        data: body,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      final data = response.data;

      return data['ok'] == true;
    } catch (e) {
      return false;
    }
  }
}
