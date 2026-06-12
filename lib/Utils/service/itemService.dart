import 'package:phoenix/Utils/class/ItemSellClass.dart';
import 'package:phoenix/Utils/class/itemBuyclass.dart';
import 'package:phoenix/Utils/service/ApiClient.dart';

class Itemservice {
  static Future<List<ItemBuyclass>> getrecomendationItem() async {
    try {
      final response = await Apiclient.dio.get(
        '/api/v1/products', //endpoint
      );
      if (response.statusCode == 200) {
        List data = response.data['data'];
        return data.map((item) => ItemBuyclass.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print("Error during API call: $e");
      return [];
    }
  }

  static Future<List<ItemBuyclass>> getitem(String category_id) async {
    try {
      final response = await Apiclient.dio.get(
        '/api/v1/products?category_id=$category_id', //endpoint
      );
      if (response.statusCode == 200) {
        List data = response.data['data'];
        return data.map((item) => ItemBuyclass.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print("Error during API call: $e");
      return [];
    }
  }

  static Future<bool> additem(Itemsellclass item) async {
    try {
      final response = await Apiclient.dio.post(
        '/api/v1/products', //endpoint
        data: item.toJson(),
      );
      if (response.statusCode == 204) {
        return true;
      } else {
        throw Exception('Failed to add product');
      }
    } catch (e) {
      print("👍Error during API call: $e");
      return false;
    }
  }
}
