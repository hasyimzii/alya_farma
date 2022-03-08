import 'package:alya_farma/models/transaction.dart';
import 'package:flutter/foundation.dart';
import '../models/cart.dart';
import '../services/transaction_api.dart';

class TransactionProvider with ChangeNotifier {
  final List<CartData> _checkout = [];
  final List<String> _paymentList = ['GoPay', 'OVO', 'Dana', 'Link Aja'];
  String _payment = 'Pilih Pembayaran';
  int _total = 0;

  List<CartData> get checkout => _checkout;
  List<String> get paymentList => _paymentList;

  String get payment => _payment;
  int get total => _total;

  void clearCheckout() {
    _checkout.clear();
    _payment = 'Pilih Pembayaran';
    _total = 0;
    notifyListeners();
  }

  void addCheckout(CartData cart) {
    _checkout.add(cart);
    notifyListeners();
  }

  void setPayment(String payment) {
    _payment = payment;
    notifyListeners();
  }

  void setTotal(int amount, int price, int discount) {
    if (discount == 0) {
      int count = amount * price;
      _total += count;
    } else {
      int count = amount * discount;
      _total += count;
    }
    notifyListeners();
  }

  Future<Transaction> storeTransaction({
    required String email,
    required String token,
  }) async {
    List<Map<String, dynamic>> cart = [];
    // looping cart
    for (CartData data in _checkout) {
      // count price & discount
      int priceCount = 0;
      int discount = int.parse(data.product.discount);
      int price = int.parse(data.product.price);

      if (discount == 0) {
        priceCount = price;
      } else {
        priceCount = discount;
      }

      Map<String, dynamic> cartDetail = {
        'cart_id': data.cartId,
        'code': data.product.code,
        'amount': data.amount,
        'price': priceCount,
      };

      cart.add(cartDetail);
    }

    Map<String, dynamic> data = {
      'email': email,
      'cart': cart,
    };

    Transaction response = await TransactionApi.storeTransaction(
      data: data,
      token: token,
    );
    return response;
  }
}
