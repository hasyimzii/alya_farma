import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';
import '../providers/auth_provider.dart';

import '../widgets/auth_layout.dart';
import '../widgets/form_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _email = TextEditingController();
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
                title: 'Email',
                controller: _email,
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
          submitTap: () {
            FocusScope.of(context).unfocus();
            // validate
            if (!(_formKey.currentState?.validate() ?? false)) return;
            _login(
              context,
              _email,
              _password,
            );
          },
          subtext: 'Belum Punya Akun?',
          alterText: 'Daftar',
          alterTap: () {
            FocusScope.of(context).unfocus();
            Navigator.popAndPushNamed(
              context,
              '/regist_page',
            );
          },
        ),
      ),
    );
  }

  Future _login(
    BuildContext context,
    TextEditingController email,
    TextEditingController password,
  ) async {
    // post api
    final AuthProvider provider = context.read<AuthProvider>();

    Auth result = await provider.login(
      email: email.text,
      password: password.text,
    );

    // if success
    if (result.success && provider.token != null) {
      Navigator.popAndPushNamed(
        context,
        '/main_page',
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
