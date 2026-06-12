import 'package:dio/dio.dart';
import 'package:phoenix/Utils/class/Authclass.dart';
import 'package:phoenix/Utils/service/ApiClient.dart';
import 'package:phoenix/Utils/service/sourseStorageservics.dart';

class Authservise {
  final Soursestorageservics _storage = Soursestorageservics();
  // static Future<bool> sendOtp(String Phone) async {
  //   try {
  //     final response = await Apiclient.dio.post(
  //       '/send-otp', //will change
  //       data: {'phone': Phone},
  //     );
  //     if (response.statusCode == 200) {
  //       if (response.data['status'] == 'success') {
  //         return true;
  //       }
  //     }
  //     return false;
  //   } on DioException catch (e) {
  //     print("Dio Error: ${e.message}");
  //     return false;
  //   } catch (e) {
  //     print("Error: $e");
  //     return false;
  //   }
  // }

  // static Future<bool> VerifyOtp(String phone, String OTP) async {
  //   try {
  //     final response = await Apiclient.dio.post(
  //       '/verify-otp', //end point from backend
  //       data: {'phone': phone, 'OTP': OTP},
  //     );
  //     if (response.statusCode == 200 && response.data['status'] == 'success') {
  //       return true;
  //     }
  //     return false;
  //   } on DioException catch (e) {
  //     print("Dio Error: ${e.message}");
  //     return false;
  //   } catch (e) {
  //     print("Error: $e");
  //     return false;
  //   }
  // }

  static Future<Authclass> register({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String gender,
    required DateTime birthdate,
    required String city,
    required String governorate,
    required String address,
  }) async {
    try {
      final body = {
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
        'gender': gender.toLowerCase(),
        'birthdate': birthdate.toUtc().toIso8601String(),
        'city': city,
        'governorate': governorate,
        'address': address,
      };
      final response = await Apiclient.dio.post(
        '/auth/register', //endpoint
        data: body,
      );
      return Authclass.fromJson(response.data);
    } on DioException catch (e) {
      final data = e.response?.data;

      String message = "Register Failed";

      if (data is Map<String, dynamic>) {
        message = data["error"] ?? message;
      } else if (data is String) {
        message = data;
      }

      return Authclass(success: false, message: message);
    }
  }

  Future<Authclass> login({
    required String identifier,
    required String password,
  }) async {
    try {
      final response = await Apiclient.dio.post(
        '/auth/login', //endpoint
        data: {"identifier": identifier, "password": password},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      final auth = Authclass.fromJson(response.data);

      if (auth.accessToken != null && auth.refreshtoken != null) {
        await _storage.saveTokens(
          accessToken: auth.accessToken!,
          refreshToken: auth.refreshtoken!,
        );
      }
      return auth;
    } on DioException catch (e) {
      final data = e.response?.data;

      String message = "Login Failed";

      if (data is Map<String, dynamic>) {
        message = data["error"] ?? message;
      } else if (data is String) {
        message = data;
      }

      return Authclass(success: false, message: message);
    }
  }

  Future<Authclass> passupdate({
    required String pass,
    required String Newpass,
  }) async {
    try {
      final response = await Apiclient.dio.put(
        '/auth/password',
        data: {'password': pass, 'new_password': Newpass},
      );
      final auth = Authclass.fromJson(response.data);
      if (auth.accessToken != null && auth.accessToken!.isNotEmpty) {
        await _storage.saveTokens(
          accessToken: auth.accessToken!,
          refreshToken: auth.refreshtoken!,
        );
      }

      return auth;
    } on DioException catch (e) {
      final data = e.response?.data;

      String message = "Login Failed";

      if (data is Map<String, dynamic>) {
        message = data["error"] ?? message;
      } else if (data is String) {
        message = data;
      }

      return Authclass(success: false, message: message);
    }
  }

  Future<bool> logout() async {
    try {
      final response = await Apiclient.dio.post('/auth/logout');

      await _storage.deleteTokens();

      return response.statusCode == 200 || response.statusCode == 204;
    } on DioException {
      return false;
    }
  }
}
