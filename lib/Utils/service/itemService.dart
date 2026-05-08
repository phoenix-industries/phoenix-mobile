import 'package:phoenix/Utils/class/ItemSellClass.dart';
import 'package:phoenix/Utils/class/itemBuyclass.dart';
import 'package:phoenix/Utils/providers/userprovider.dart';
import 'package:phoenix/Utils/service/ApiClient.dart';
import 'package:provider/provider.dart';

class Itemservice {
  static Future<List<ItemBuyclass>> getrecomendationItem() async {
    try {
      final response = await Apiclient.dio.get(
        '/products', //endpoint
      );
      if (response.statusCode == 200) {
        List data = response.data['products'];
        return data.map((item) => ItemBuyclass.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print("Error during API call: $e");
      return [];
    }
  }

  static Future<List<ItemBuyclass>> getitem(String category) async {
    try {
      final response = await Apiclient.dio.get(
        '/products/category/$category', //endpoint
      );
      if (response.statusCode == 200) {
        List data = response.data['products'];
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
        '/products/add', //endpoint
        data: item.toJson(),
      );
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        throw Exception('Failed to add product');
      }
    } catch (e) {
      print("Error during API call: $e");
      return false;
    }
  }
}
