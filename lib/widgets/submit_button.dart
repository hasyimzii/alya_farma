import 'package:flutter/material.dart';
import '../common/style.dart';

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
        margin: const EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        child: ElevatedButton(
          child: Text(text),
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            primary: greenColor,
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
