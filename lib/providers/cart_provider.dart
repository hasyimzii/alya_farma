import 'package:flutter/cupertino.dart';
import '../models/cart.dart';
import '../models/medic.dart';

class CartProvider with ChangeNotifier {
  final List<Cart> _cart = [];
  final List<int> _amount = [];
  final List<bool> _check = [];
  String _message = '';

  List get cart => _cart;
  List get amount => _amount;
  List get check => _check;
  String get messagge => _message;
  int get length => _cart.length;

  void addCart(Medic medic) {
    for (Cart data in _cart) {
      // check if exist
      if (medic == data.medic) {
        _message = 'Produk sudah ada di keranjang!';
        return;
      }
    }
    // add list if not exist
    _cart.add(
      Cart(
        amount: 1,
        check: false,
        medic: medic,
      ),
    );
    _amount.add(1);
    _check.add(false);
    _message = 'Berhasil masuk keranjang';
    notifyListeners();
  }

  void checkCart(int index, bool value) {
    _check[index] = value;
    notifyListeners();
  }

  void addAmount(int index) {
    // add amount value
    _amount[index] += 1;
    notifyListeners();
  }

  void subAmount(int index) {
    int amount = _amount[index];

    // chack if not 0
    if (amount > 0) {
      // sub amount value
      _amount[index] -= 1;
      notifyListeners();
    }
  }

  void deleteCart(int index) {
    // delete cart
    _cart.removeAt(index);
    notifyListeners();
  }
}
