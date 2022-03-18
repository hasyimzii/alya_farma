import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/auth_bloc.dart';

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
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLoaded) {
                if (state.success) {
                  Navigator.popAndPushNamed(
                    context,
                    '/login_page',
                  );
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 1),
                    content: Text(state.message),
                  ),
                );
              }
            },
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
                FocusScope.of(context).unfocus();
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
                  final AuthBloc _authBloc = context.read<AuthBloc>();
                  _authBloc.add(Regist(
                    name: _fullname.text,
                    email: _email.text,
                    password: _password.text,
                    phone: _phone.text,
                  ));
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
      ),
    );
  }
}
