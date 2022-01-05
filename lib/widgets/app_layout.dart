import 'package:flutter/material.dart';
import '../config/style.dart';

class AppLayout extends StatelessWidget {
  final double radius;
  final Color color;
  final Widget title;
  final Widget body;

  const AppLayout({
    Key? key,
    required this.radius,
    required this.color,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: title,
        backgroundColor: color,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(radius),
          ),
        ),
      ),
      body: SafeArea(
        child: body,
      ),
    );
  }
}
