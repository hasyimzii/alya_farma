import 'package:flutter/cupertino.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User _user = User(name: 'name', email: 'email', phone: 'phone');

  User get user => _user;

  void setUser(String name, String phone) {
    User newUser = User(name: name, email: _user.email, phone: phone);
    _user = newUser;
    notifyListeners();
  }
}