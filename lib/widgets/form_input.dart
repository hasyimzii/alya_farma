import 'package:flutter/material.dart';
import '../common/style.dart';

class FormInput extends StatelessWidget {
  final bool obscureText;
  final String title;
  final TextEditingController controller;

  const FormInput({
    Key? key,
    required this.obscureText,
    required this.title,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 15,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          labelText: title,
          labelStyle: subtitleText(13),
        ),
        validator: (String? value) {
          if (value?.isEmpty ?? true) return 'required';
        },
      ),
    );
  }
}
