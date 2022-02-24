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
    required String token,
  }) async {
    Map<String, dynamic> data = {
      'email': Crypt.encode(email),
      'product_id': productId,
    };

    Cart response = await CartApi.storeCart(
      data: data,
      token: token,
    );
    return response;
  }

  void addCheck(int length) {
    _check.clear();
    for (var i = 0; i < length; i++) {
      _check.add(false);
    }
    notifyListeners();
  }

  void checkCart(int index, bool value) {
    _check[index] = value;
    notifyListeners();
  }

  Future<void> addAmount({
    required String id,
    required String token,
  }) async {
    Map<String, dynamic> data = {
      'id': int.parse(id),
    };
    await CartApi.addAmountCart(
      data: data,
      token: token,
    );
  }

  Future<void> subAmount({
    required String id,
    required String amount,
    required String token,
  }) async {
    // check if not 0
    if (int.parse(amount) > 0) {
      Map<String, dynamic> data = {
        'id': int.parse(id),
      };
      await CartApi.subAmountCart(
        data: data,
        token: token,
      );
    }
  }

  Future<void> deleteCart({
    required String id,
    required int index,
    required String token,
  }) async {
    Map<String, dynamic> data = {
      'id': int.parse(id),
    };
    await CartApi.deleteCart(
      data: data,
      token: token,
    );

    _check.removeAt(index);
    notifyListeners();
  }
}
