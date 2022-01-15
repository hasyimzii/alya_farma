import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/style.dart';

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
          currentIndex: navigation.currentIndex,
          selectedItemColor: blueColor,
          iconSize: 23,
          unselectedFontSize: 10,
          selectedFontSize: 10,
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
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
          onTap: (int index) {
            navigation.setScreen(index);
          },
        ),
      );
    });
  }
}
