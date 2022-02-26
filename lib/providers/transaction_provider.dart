import 'package:flutter/foundation.dart';
import '../models/cart.dart';

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
}
