import 'package:alya_farma/config/style.dart';
import 'package:flutter/material.dart';

import 'search_bar.dart';

class AppLayout extends StatelessWidget {
  final double radius;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback onClear;
  final Widget body;

  const AppLayout({
    Key? key,
    required this.radius,
    required this.controller,
    required this.onChanged,
    required this.onClear,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SearchBar(
          controller: controller,
          onChanged: onChanged,
          onClear: onClear,
        ),
        backgroundColor: blueColor,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(radius),
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
