import 'package:flutter/cupertino.dart';
import '../models/tansaction.dart';

class TransactionProvider with ChangeNotifier {
  final List<Transaction> _transaction = [];

  List<Transaction> get medic => _transaction;
  int get length => _transaction.length;
}