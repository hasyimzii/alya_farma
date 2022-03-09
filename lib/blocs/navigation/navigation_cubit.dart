import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../views/product_list.dart';
import '../../views/cart_page.dart';
import '../../views/transaction_history.dart';
import '../../views/profile_page.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(const NavigationState(
          currentIndex: 0,
          currentScreen: ProductList(),
        ));

  final List<Widget> _screen = [
    const ProductList(),
    const CartPage(),
    const TransactionHistory(),
    const ProfilePage(),
  ];

  void setScreen(int index) => emit(NavigationState(
        currentIndex: index,
        currentScreen: _screen[index],
      ));
}
