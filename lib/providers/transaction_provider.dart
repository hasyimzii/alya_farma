import 'package:flutter/cupertino.dart';
import '../models/tansaction.dart';
import '../models/cart.dart';
import '../models/medic.dart';

class TransactionProvider with ChangeNotifier {
  final List<Transaction> _transaction = [];

  List<Transaction> get transaction => _transaction;
  int get length => _transaction.length;

  void addTransaction(Medic medic, int amount) {
    return;
  }
}