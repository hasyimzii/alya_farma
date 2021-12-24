import 'package:alya_farma/config/style.dart';
import 'package:flutter/material.dart';

import 'search_bar.dart';

class AppLayout extends StatelessWidget {
  final double radius;
  final bool readOnly;
  final TextEditingController controller;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback onClear;
  final Widget body;

  const AppLayout({
    Key? key,
    required this.radius,
    required this.readOnly,
    required this.controller,
    required this.onSubmitted,
    required this.onClear,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SearchBar(
          readOnly: readOnly,
          controller: controller,
          onSubmitted: onSubmitted,
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
