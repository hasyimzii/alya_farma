import 'package:flutter/foundation.dart';
import '../models/transaction.dart';
import '../models/cart.dart';

class TransactionProvider with ChangeNotifier {
  final List<CartData> _checkout = [];
  final List<String> _paymentList = ['GoPay', 'OVO', 'Dana', 'Link Aja'];
  String _payment = 'Pilih Pembayaran';

  List<CartData> get checkout => _checkout;
  List<String> get paymentList => _paymentList;
  
  String get payment => _payment;

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
}
