import 'package:flutter/material.dart';
import '../config/style.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const SubmitButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.all(15),
        width: double.infinity,
        child: ElevatedButton(
          child: Text(text),
          style: ElevatedButton.styleFrom(
            primary: greenColor,
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
