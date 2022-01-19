import 'package:flutter/cupertino.dart';
import '../models/medic.dart';

class CartProvider with ChangeNotifier {
  final List<Medic> _medic = [];
  final List<Map<String, dynamic>> _cart = [];
  
  List get medic => _medic;
  List get cart => _cart;
  int get length => _cart.length;

  void addCart(Medic medic) {
    // add list
    _medic.add(medic);
    _cart.add({
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
    int quantity = _cart[index]['quantity'];

    // chack if not 0
    if(quantity > 0) {
      // sub quantity value
      _cart[index]['quantity'] -= 1;
      notifyListeners();
    }
  }

  void deleteCart(int index) {
    // delete cart
    _cart.removeAt(index);
    notifyListeners();
  }
}