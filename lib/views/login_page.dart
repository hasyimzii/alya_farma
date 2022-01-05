import 'package:flutter/material.dart';

import '../widgets/auth_layout.dart';
import '../widgets/form_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _username = TextEditingController();
    final TextEditingController _password = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: AuthLayout(
          formKey: _formKey,
          title: 'Masuk',
          subtitle: 'Masukkan Akun yang sudah terdaftar.',
          body: Column(
            children: [
              FormInput(
                obscureText: false,
                title: 'Username',
                controller: _username,
              ),
              const SizedBox(height: 15),
              FormInput(
                obscureText: true,
                title: 'Password',
                controller: _password,
              ),
            ],
          ),
          submitTitle: 'Login',
          submitTap: () {},
          subtext: 'Belum Punya Akun?',
          alterText: 'Daftar',
          alterTap: () {
            Navigator.popAndPushNamed(
              context,
              '/regist_page',
            );
          },
        ),
      ),
    );
  }
}
