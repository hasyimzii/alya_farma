import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'providers/navigation_provider.dart';
import 'providers/cart_provider.dart';
import 'providers/transaction_provider.dart';
import 'providers/user_provider.dart';

import 'views/main_page.dart';
import 'views/regist_page.dart';
import 'views/login_page.dart';
import 'views/profile_page.dart';
import 'views/profile_edit.dart';
import 'views/product_list.dart';
import 'views/product_detail.dart';
import 'views/search_page.dart';
import 'views/category_page.dart';
import 'views/cart_page.dart';
import 'views/transaction_page.dart';
import 'views/about_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => NavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => UserProvider(),
        ),
      ],
      builder: (
        BuildContext context,
        Widget? child,
      ) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
          initialRoute: '/login_page',
          routes: {
            '/main_page': (context) => const MainPage(),
            '/regist_page': (context) => const RegistPage(),
            '/login_page': (context) => const LoginPage(),
            '/profile_page': (context) => const ProfilePage(),
            '/profile_edit': (context) => const ProfileEdit(),
            '/product_list': (context) => const ProductList(),
            '/product_detail': (context) => const ProductDetail(),
            '/search_page': (context) => const SearchPage(),
            '/category_page': (context) => const CategoryPage(),
            '/cart_page': (context) => const CartPage(),
            '/transaction_page': (context) => const TransactionPage(),
            '/about_page': (context) => const AboutPage(),
          },
        );
      },
    );
  }
}
