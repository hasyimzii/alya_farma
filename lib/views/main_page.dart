import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/style.dart';

import '../blocs/navigation/navigation_cubit.dart';
import '../providers/auth_provider.dart';

import '../widgets/search_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (BuildContext context, NavigationState state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: SearchBar(
              readOnly: true,
              controller: TextEditingController(),
              onSubmitted: (value) {},
            ),
            backgroundColor: blueColor,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
          ),
          body: SafeArea(
            child: state.currentScreen,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: blueColor,
            unselectedItemColor: greyColor,
            showUnselectedLabels: true,
            iconSize: 23,
            unselectedFontSize: 10,
            selectedFontSize: 10,
            currentIndex: state.currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Keranjang',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt),
                label: 'Transaksi',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
            onTap: (int index) {
              final AuthProvider provider = context.read<AuthProvider>();
              final NavigationCubit _navigation =
                  context.read<NavigationCubit>();

              if (provider.token != null) {
                _navigation.setScreen(index);
              } else {
                Navigator.pushNamed(
                  context,
                  '/login_page',
                );
              }
            },
          ),
        );
      },
    );
  }
}
