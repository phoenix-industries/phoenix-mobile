import 'package:dio/dio.dart';
import 'package:phoenix/Utils/class/UserClass.dart';
import 'package:phoenix/Utils/service/ApiClient.dart';

class Usreservice {
  Future<UserClass?> getCurrentUser() async {
    try {
      final response = await Apiclient.dio.get('/auth/me');

      return UserClass.fromJson(response.data);
    } on DioException catch (e) {
      print("Get User Error: ${e.message}");
      return null;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<UserClass?> updateUser({
    required int Id,
    required String name,
    required String email,
    required String phone,
    required int age,
    String? image,
    String? Bio,
    String? governorate,
    String? city,
  }) async {
    try {
      final response = await Apiclient.dio.put(
        '', //endpoint
        data: {
          'id': Id,
          'name': name,
          'email': email,
          'phone': phone,
          'age': age,
          'image': image,
          'bio': Bio,
          'governorate': governorate,
          'city': city,
        },
      );
      return UserClass.fromJson(response.data);
    } on DioException catch (e) {
      print("PUT Error: ${e.response?.data}");
      return null;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
