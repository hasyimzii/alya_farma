import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/style.dart';

import '../providers/auth_provider.dart';
import '../providers/navigation_provider.dart';

import '../widgets/search_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(builder: (
      BuildContext context,
      NavigationProvider navigation,
      Widget? child,
    ) {
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
          child: navigation.currentScreen,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: blueColor,
          unselectedItemColor: greyColor,
          showUnselectedLabels: true,
          iconSize: 23,
          unselectedFontSize: 10,
          selectedFontSize: 10,
          currentIndex: navigation.currentIndex,
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

            if (provider.token != null) {
              navigation.setScreen(index);
            } else {
              Navigator.pushNamed(
                context,
                '/login_page',
              );
            }
          },
        ),
      );
    });
  }
}
