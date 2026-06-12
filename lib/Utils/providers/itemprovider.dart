import 'package:flutter/material.dart';
import 'package:phoenix/Utils/class/itemBuyclass.dart';
import 'package:phoenix/Utils/service/itemService.dart';

class Itemprovider extends ChangeNotifier {
  List<ItemBuyclass> items = [];
  bool isloading = false;

  Future<void> recomdationitem() async {
    isloading = true;
    notifyListeners();
    try {
      items = await Itemservice.getrecomendationItem();
    } catch (e) {
      debugPrint('😂$e');
      items = [];
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  Future<void> getitem(String category) async {
    isloading = true;
    notifyListeners();
    try {
      items = await Itemservice.getitem(category);
    } catch (e) {
      items = [];
    } finally {
      isloading = false;
      notifyListeners();
    }
  }
}
