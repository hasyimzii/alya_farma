import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/auth_bloc.dart';

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
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoaded) {
              if (state.success) {
                Navigator.popAndPushNamed(
                  context,
                  '/main_page',
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

              final AuthBloc _authBloc = context.read<AuthBloc>();
              _authBloc.add(Login(
                email: _email.text,
                password: _password.text,
              ));
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
      ),
    );
  }
}
