import 'package:flutter/cupertino.dart';
import '../models/cart.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final List<Cart> _cart = [];
  final List<bool> _check = [];
  String _message = '';

  List<Cart> get cart => _cart;
  List<bool> get check => _check;
  String get messagge => _message;
  int get length => _cart.length;

  void addCart(ProductData product) {
    for (Cart data in _cart) {
      // check if exist
      if (product == product) {
        _message = 'Produk sudah ada di keranjang!';
        return;
      }
    }
    // add list if not exist
    _cart.add(
      Cart(
        amount: 1,
        product: product,
      ),
    );
    // add checkbox
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
    // _cart[index].amount += 1;
    notifyListeners();
  }

  void subAmount(int index) {
    int amount = _cart[index].amount;

    // chack if not 0
    if (amount > 0) {
      // sub amount value
      // _cart[index].amount -= 1;
      notifyListeners();
    }
  }

  void deleteCart(int index) {
    // delete cart
    _cart.removeAt(index);
    // delete check
    _check.removeAt(index);
    notifyListeners();
  }
}
