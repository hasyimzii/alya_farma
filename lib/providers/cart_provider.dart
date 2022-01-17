import 'package:flutter/cupertino.dart';
import '../models/medic.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cart = [];
  
  List get cart => _cart;
  int get length => _cart.length;

  void addCart(Medic medic) {
    // add list
    _cart.add({
      'medic': medic,
      'quantity': 1,
      'check': false,
    });
    notifyListeners();
  }

  void checkCart(int index, bool value) {
    _cart[index]['check'] = value;
    notifyListeners();
  }

  void addQuantity(int index) {
    // add quantity value
    _cart[index]['quantity'] += 1;
    notifyListeners();
  }

  void subQuantity(int index) {
    // sub quantity value
    _cart[index]['quantity'] -= 1;
    notifyListeners();
  }

  void deleteCart(int index) {
    // delete cart
    _cart.removeAt(index);
    notifyListeners();
  }
}