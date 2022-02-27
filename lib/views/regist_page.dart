import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';
import '../providers/auth_provider.dart';

import '../widgets/auth_layout.dart';
import '../widgets/form_input.dart';

class RegistPage extends StatelessWidget {
  const RegistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _fullname = TextEditingController();
    final TextEditingController _email = TextEditingController();
    final TextEditingController _phone = TextEditingController();
    final TextEditingController _password = TextEditingController();
    final TextEditingController _confirmPassword = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  title: 'Email',
                  controller: _email,
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
            submitTap: () {
              // validate
              if (!(_formKey.currentState?.validate() ?? false)) return;
              if (_password.text.length < 8) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text('Password minimal 8 karakter!'),
                  ),
                );
              } else if (_password.text != _confirmPassword.text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text('Konfirmasi password salah!'),
                  ),
                );
              } else {
                _regist(
                  context,
                  _fullname,
                  _email,
                  _phone,
                  _password,
                  _confirmPassword,
                );
              }
            },
            subtext: 'Sudah Punya Akun?',
            alterText: 'Masuk',
            alterTap: () {
              FocusScope.of(context).unfocus();
              Navigator.popAndPushNamed(
                context,
                '/login_page',
              );
            },
          ),
        ),
      ),
    );
  }

  Future _regist(
    BuildContext context,
    TextEditingController fullname,
    TextEditingController email,
    TextEditingController phone,
    TextEditingController password,
    TextEditingController confirmPassword,
  ) async {
    // post api
    final AuthProvider provider = context.read<AuthProvider>();
    Auth result = await provider.regist(
      name: fullname.text,
      email: email.text,
      password: password.text,
      phone: phone.text,
    );

    // if success
    if (result.success) {
      Navigator.popAndPushNamed(
        context,
        '/login_page',
      );
    }
    // show message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(result.message),
      ),
    );
  }
}
