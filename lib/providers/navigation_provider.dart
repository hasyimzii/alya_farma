import 'package:flutter/cupertino.dart';
import '../models/product.dart';
import '../network/product_api.dart';

import '../views/product_list.dart';
import '../views/cart_page.dart';
import '../views/transaction_history.dart';
import '../views/profile_page.dart';

class NavigationProvider with ChangeNotifier {
  final List<Widget> _screen = [
    const ProductList(),
    const CartPage(),
    const TransactionHistory(),
    const ProfilePage(),
  ];

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  Widget get currentScreen => _screen[_currentIndex];

  void setScreen(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // String _text = '';
  // String get text => _text;

  // void search(String value) {
  //   _text = value;
  //   notifyListeners();
  // }

  final List<ProductData> _product = [];

  Future getProduct() async {
    _product.clear();
    notifyListeners();
    // get product
    Product result = await ProductApi.getProduct();

    if (result.data!.isNotEmpty) {
      for (ProductData product in result.data!) {
        _product.add(product);
        notifyListeners();
      }
    }
  }

  final List<ProductData> _searchData = [];
  List<ProductData> get searchData => _searchData;

  void search(String search) {
    _searchData.clear();
    notifyListeners();

    if (_product.isNotEmpty) {
      for (ProductData data in _product) {
        if (data.name.toLowerCase().contains(search.toLowerCase()) ||
            data.category.toLowerCase().contains(search.toLowerCase())) {
          _searchData.add(data);
          notifyListeners();
        }
      }
    }
  }
}
