import 'package:alya_farma/common/style.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final bool searchBar;
  final Widget title;
  final Widget body;

  const AppLayout({
    Key? key,
    required this.searchBar,
    required this.title,
    required this.body,
  }) : super(key: key);

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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      );
    }
  }
}
