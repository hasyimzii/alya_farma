import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/auth/auth_bloc.dart';
import 'blocs/navigation/navigation_cubit.dart';
import 'blocs/category/category_bloc.dart';
import 'blocs/product/product_bloc.dart';
import 'blocs/cart/cart_bloc.dart';
import 'blocs/user/user_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(),
        ),
        BlocProvider(
          create: (context) => ProductBloc(),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        initialRoute: '/main_page',
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
      ),
    );
  }
}
