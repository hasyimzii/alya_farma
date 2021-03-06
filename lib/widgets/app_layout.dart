import 'package:flutter/material.dart';
import '../utils/style.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({
    Key? key,
    required this.searchBar,
    required this.title,
    required this.body,
  }) : super(key: key);

  final bool searchBar;
  final Widget title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar(searchBar),
      body: body,
    );
  }

  PreferredSizeWidget _appBar(bool searchBar) {
    if (searchBar) {
      return AppBar(
        centerTitle: true,
        title: title,
        backgroundColor: blueColor,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      );
    } else {
      return AppBar(
        centerTitle: true,
        title: title,
        iconTheme: IconThemeData(
          color: blackColor,
        ),
        backgroundColor: whiteColor,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      );
    }
  }
}
