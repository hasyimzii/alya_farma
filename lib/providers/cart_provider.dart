import 'package:flutter/foundation.dart';
import '../common/crypt.dart';
import '../models/cart.dart';
import '../network/cart_api.dart';

class CartProvider with ChangeNotifier {
  final List<bool> _check = [];
  List<bool> get check => _check;

  Future<Cart> storeCart({
    required String email,
    required String productId,
  }) async {
    Map<String, dynamic> data = {
      'email': Crypt.encode(email),
      'product_id': productId,
    };

    Cart response = await CartApi.storeCart(data: data);
    return response;
  }

  void addCheck(int length) {
    for (var i = 0; i < length; i++) {
      _check.add(false);
    }
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

  void subAmount(int index, int amount) {
    // chack if not 0
    if (amount > 0) {
      // sub amount value
      // _cart[index].amount -= 1;
      notifyListeners();
    }
  }

  void deleteCart(int index) {
    // delete cart
    // _cart.removeAt(index);
    // delete check
    _check.removeAt(index);
    notifyListeners();
  }
}
