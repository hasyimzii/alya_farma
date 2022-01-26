import 'package:flutter/cupertino.dart';
import '../models/tansaction.dart';
import '../models/cart.dart';
import '../models/medic.dart';

class TransactionProvider with ChangeNotifier {
  final List<Cart> _checkout = [];
  final List<String> _paymentList = ['GoPay', 'OVO', 'Dana', 'Link Aja'];
  String _payment = 'Pilih Pembayaran';
  final List<Transaction> _transaction = [];

  TransactionProvider() {
    _checkout.clear();
    _payment = 'Pilih Pembayaran';
  }

  List<Cart> get checkout => _checkout;
  int get checkoutLength => _checkout.length;

  List<String> get paymentList => _paymentList;
  int get paymentLength => _paymentList.length;
  String get payment => _payment;

  List<Transaction> get transaction => _transaction;
  int get length => _transaction.length;

  void addCheckout(List<Cart> cart) {
    for (Cart data in cart) {
      if (data.check == true) {
        _checkout.add(
          Cart(
            amount: data.amount,
            check: data.check,
            medic: data.medic,
          ),
        );
      }
    }
  }

  void setPayment(String payment) {
    _payment = payment;
    notifyListeners();
  }
}
