import 'package:flutter/material.dart';
import 'package:phoenix/Utils/class/UserClass.dart';

class Userprovider extends ChangeNotifier {
  UserClass? _user;

  UserClass? get User => _user;

  void setuser(UserClass user) {
    _user = user;
    notifyListeners();
  }

  void clearuser() {
    _user = null;
    notifyListeners();
  }
}
