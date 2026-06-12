import 'package:dio/dio.dart';
import 'package:phoenix/Utils/class/UserClass.dart';
import 'package:phoenix/Utils/service/ApiClient.dart';

class Usreservice {
  static final Map<String, UserClass> _cache = {};
  static Future<UserClass> getCurrentuser() async {
    final response = await Apiclient.dio.get('/api/v1/users/me');
    if (response.statusCode == 200) {
      return UserClass.fromJson(response.data['data']);
    } else {
      throw Exception("Failed to load profile");
    }
  }

  // Get user (with cache)
  static Future<UserClass> getUserById(String userId) async {
    if (_cache.containsKey(userId)) {
      return _cache[userId]!;
    }

    final response = await Apiclient.dio.get('/api/v1/users/$userId');

    final user = UserClass.fromJson(response.data['data']);

    _cache[userId] = user;

    return user;
  }

  // Preload users (important for lists)
  static Future<void> preloadUsers(List<String> userIds) async {
    final uniqueIds = userIds.toSet();

    for (final id in uniqueIds) {
      await getUserById(id);
    }
  }

  // 🔥 Get instantly from cache (no API)
  static UserClass? getCachedUser(String userId) {
    return _cache[userId];
  }

  // 🔥 optional: clear cache
  static void clearCache() {
    _cache.clear();
  }

  Future<bool> updateUser({
    String? name,
    String? image,
    String? governorate,
    String? city,
    String? address,
  }) async {
    try {
      final data = <String, dynamic>{};

      if (name != null) data['name'] = name;
      if (image != null) data['image'] = image;
      if (governorate != null) data['governorate'] = governorate;
      if (city != null) data['city'] = city;
      if (address != null) data['address'] = address;

      final response = await Apiclient.dio.patch(
        '/api/v1/users/me', //endpoint
        data: data,
      );
      if (response.statusCode == 204) {
        return true;
      }
      return false;
    } on DioException catch (e) {
      print("PUT Error: ${e.response?.data}");
      return false;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}
