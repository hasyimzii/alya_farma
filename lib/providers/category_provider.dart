import 'package:flutter/cupertino.dart';
import '../network/category_api.dart';
import '../models/category.dart';
import '../models/medic.dart';

class CategoryProvider with ChangeNotifier {
  final List<Medic> _medic = [];

  final List<Medic> _categoryResult = [];
  List<Medic> get categoryResult => _categoryResult;
  int get categoryLength => _categoryResult.length;

  void medicCategory(String category) {
    _categoryResult.clear();
    for (Medic data in _medic) {
      if (data.category == category) {
        _categoryResult.add(data);
      }
    }
    notifyListeners();
  }
}
