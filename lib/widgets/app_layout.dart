import 'package:flutter/material.dart';

import 'search_bar.dart';

class AppLayout extends StatelessWidget {
  final Color color;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback onClear;
  final Widget body;

  const AppLayout({
    Key? key,
    required this.color,
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
        backgroundColor: color,
        elevation: 3,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
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
