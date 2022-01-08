import 'package:flutter/material.dart';

import '../widgets/auth_layout.dart';
import '../widgets/form_input.dart';

class RegistPage extends StatelessWidget {
  const RegistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _fullname = TextEditingController();
    final TextEditingController _phone = TextEditingController();
    final TextEditingController _password = TextEditingController();
    final TextEditingController _confirmPassword = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: AuthLayout(
          formKey: _formKey,
          title: 'Daftar',
          subtitle: 'Daftar menggunakan akun baru.',
          body: Column(
            children: [
              FormInput(
                obscureText: false,
                title: 'Nama Lengkap',
                controller: _fullname,
              ),
              const SizedBox(height: 15),
              FormInput(
                obscureText: false,
                title: 'No. Telpon',
                controller: _phone,
              ),
              const SizedBox(height: 15),
              FormInput(
                obscureText: true,
                title: 'Password',
                controller: _password,
              ),
              const SizedBox(height: 15),
              FormInput(
                obscureText: true,
                title: 'Konfirmasi Password',
                controller: _confirmPassword,
              ),
            ],
          ),
          submitTitle: 'Daftar',
          submitTap: () {},
          subtext: 'Sudah Punya Akun?',
          alterText: 'Masuk',
          alterTap: () {
            Navigator.popAndPushNamed(
              context,
              '/login_page',
            );
          },
        ),
      ),
    );
  }
}
