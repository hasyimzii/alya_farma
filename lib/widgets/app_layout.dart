import 'package:flutter/material.dart';
import '../config/style.dart';

class AppLayout extends StatelessWidget {
  final Widget title;
  final Widget body;

  const AppLayout({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0), // here the desired height
        child: AppBar(
          centerTitle: true,
          title: title,
          backgroundColor: blueColor,
          elevation: 3,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: body,
        ),
      ),
    );
  }
}
