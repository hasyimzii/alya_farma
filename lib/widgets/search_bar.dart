import 'package:flutter/material.dart';
import '../config/style.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback onClear;

  const SearchBar({
    Key? key,
    required this.controller,
    required this.onSubmitted,
    required this.onClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 33,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          onSubmitted: onSubmitted,
          style: searchTextStyle,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0),
            prefixIcon: const Icon(
              Icons.search,
              size: 20,
            ),
            suffixIcon: IconButton(
              padding: const EdgeInsets.all(7),
              icon: const Icon(
                Icons.clear,
                size: 20,
              ),
              onPressed: onClear,
            ),
            hintText: 'Cari di Alya Farma...',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
