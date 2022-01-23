import 'package:flutter/material.dart';
import '../common/style.dart';

import '../widgets/submit_button.dart';

class AuthLayout extends StatelessWidget {
  final GlobalKey formKey;
  final String title;
  final String subtitle;
  final Widget body;
  final String submitTitle;
  final VoidCallback submitTap;
  final String subtext;
  final String alterText;
  final VoidCallback alterTap;

  const AuthLayout({
    Key? key,
    required this.formKey,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.submitTitle,
    required this.submitTap,
    required this.subtext,
    required this.alterText,
    required this.alterTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 200,
              ),
              const SizedBox(height: 25),
              ListTile(
                title: Text(
                  title,
                  style: titleText(25),
                ),
                subtitle: Text(
                  subtitle,
                  style: subtitleText(13),
                ),
              ),
              const SizedBox(height: 15),
              body,
              const SizedBox(height: 15),
              SubmitButton(
                text: submitTitle,
                onTap: submitTap,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    subtext,
                    style: searchText(12),
                  ),
                  TextButton(
                    child: Text(
                      alterText,
                      style: const TextStyle(fontSize: 12),
                    ),
                    onPressed: alterTap,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
