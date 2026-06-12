import 'package:flutter/material.dart';
import 'package:phoenix/Utils/class/UserClass.dart';
import 'package:phoenix/Utils/service/usreservice.dart';

class Userprovider extends ChangeNotifier {
  UserClass? _user;

  UserClass? get User => _user;

  void setuser(UserClass user) {
    _user = user;
    notifyListeners();
  }

  Future<void> refreshUsre() async {
    final updateduser = await Usreservice.getCurrentuser();
    _user = updateduser;
    notifyListeners();
  }

  void clearuser() {
    _user = null;
    notifyListeners();
  }
}
