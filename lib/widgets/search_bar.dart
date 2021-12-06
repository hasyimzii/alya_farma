import 'package:flutter/material.dart';
import '../config/style.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final ValueChanged<String>? onChanged;

  const SearchBar({
    Key? key,
    required this.controller,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          onChanged: onChanged,
          style: infoTextStyle,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                FocusScope.of(context).unfocus();
              },
            ),
            hintText: 'Cari Obat...',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
