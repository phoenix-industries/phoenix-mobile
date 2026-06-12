import 'package:dio/dio.dart';
import 'package:phoenix/Utils/class/categoryClass.dart';
import 'package:phoenix/Utils/service/ApiClient.dart';

class Categoryservice {
  static Future<List<Categoryclass>> getListCatgory() async {
    try {
      final response = await Apiclient.dio.get('/api/v1/products/categories');

      if (response.statusCode == 200) {
        final json = response.data;
        final List list = json['data'];
        final categories = list
            .map((item) => Categoryclass.fromJson(item))
            .toList();

        print("🔥 CATEGORIES FROM API:");
        for (var c in categories) {
          print("id: ${c.id} | name: ${c.name}");
        }

        return categories;
      }

      return [];
    } on DioException catch (e) {
      print(e.message);
      return [];
    }
  }
}
