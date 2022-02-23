import 'package:flutter/cupertino.dart';
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
}