import 'package:dio/dio.dart';
import 'package:phoenix/Utils/class/Authclass.dart';
import 'package:phoenix/Utils/service/ApiClient.dart';
import 'package:phoenix/Utils/service/sourseStorageservics.dart';

class Authservise {
  final Soursestorageservics _storage = Soursestorageservics();
  static Future<bool> sendOtp(String Phone) async {
    try {
      final response = await Apiclient.dio.post(
        '/send-otp', //will change
        data: {'phone': Phone},
      );
      if (response.statusCode == 200) {
        if (response.data['status'] == 'success') {
          return true;
        }
      }
      return false;
    } on DioException catch (e) {
      print("Dio Error: ${e.message}");
      return false;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  static Future<bool> VerifyOtp(String phone, String OTP) async {
    try {
      final response = await Apiclient.dio.post(
        '/verify-otp', //end point from backend
        data: {'phone': phone, 'OTP': OTP},
      );
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        return true;
      }
      return false;
    } on DioException catch (e) {
      print("Dio Error: ${e.message}");
      return false;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  static Future<Authclass> register({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String gender,
    required String age,
  }) async {
    try {
      final response = await Apiclient.dio.post(
        '', //endpoint
        data: {
          'name': name,
          'phone': phone,
          'email': email,
          'password': password,
          'gender': gender,
          'age': age,
        },
      );
      return Authclass.fromJson(response.data);
    } on DioException catch (e) {
      return Authclass(
        success: false,
        message: e.response?.data["message"] ?? "Server Error",
      );
    }
  }

  Future<Authclass> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await Apiclient.dio.post(
        '/auth/login', //endpoint
        data: {"username": "michaelw", "password": "michaelwpass"},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      final accesstoken = response.data['token'];

      if (accesstoken != null) {
        await _storage.savetoken(accesstoken);
      }

      return Authclass.fromJson(response.data);
    } on DioException catch (e) {
      return Authclass(
        success: false,
        message: e.response?.data["message"] ?? "login field",
      );
    }
  }
}
