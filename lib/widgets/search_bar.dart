import 'package:flutter/material.dart';
import '../config/style.dart';

class SearchBar extends StatelessWidget {
  final bool readOnly;
  final TextEditingController controller;
  final ValueChanged<String>? onSubmitted;

  const SearchBar({
    Key? key,
    required this.readOnly,
    required this.controller,
    required this.onSubmitted,
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
        child: _searchBar(context, readOnly),
      ),
    );
  }

  Widget _searchBar(BuildContext context, bool readOnly) {
    if (readOnly) {
      return TextField(
        readOnly: readOnly,
        onTap: () {
          Navigator.pushNamed(
            context,
            '/search_page',
          );
        },
        style: searchText(12),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            size: 20,
          ),
          hintText: 'Cari di Alya Farma...',
          border: InputBorder.none,
        ),
      );
    } else {
      return TextField(
        controller: controller,
        readOnly: readOnly,
        keyboardType: TextInputType.text,
        onSubmitted: onSubmitted,
        style: searchText(12),
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
            onPressed: () {
            controller.clear();
            FocusScope.of(context).unfocus();
          },
          ),
          hintText: 'Cari di Alya Farma...',
          border: InputBorder.none,
        ),
      );
    }
  }
}
