import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/style.dart';

import '../models/user.dart';

import '../blocs/auth/auth_bloc.dart';
import '../blocs/user/user_bloc.dart';

import '../widgets/app_layout.dart';
import '../widgets/form_input.dart';
import '../widgets/submit_button.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // define arguments
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    UserData user = args['user'];

    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    _nameController.text = user.name;
    _phoneController.text = user.phone;

    return AppLayout(
      searchBar: false,
      title: Text(
        'Ubah Profil',
        style: titleText(15),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserLoaded) {
            if (state.success) {
              Navigator.popAndPushNamed(
                context,
                '/profile_page',
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(
                    'Ubah Profil',
                    style: titleText(25),
                  ),
                  subtitle: Text(
                    'Perbarui profil sesuai data diri kamu.',
                    style: subtitleText(13),
                  ),
                ),
                const SizedBox(height: 15),
                FormInput(
                  obscureText: false,
                  title: 'Nama',
                  controller: _nameController,
                ),
                const SizedBox(height: 15),
                FormInput(
                  obscureText: false,
                  title: 'No Telpon',
                  controller: _phoneController,
                ),
                const SizedBox(height: 15),
                FormInput(
                  obscureText: true,
                  title: 'Validasi Password',
                  controller: _passwordController,
                ),
                const SizedBox(height: 15),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, authState) {
                    return SubmitButton(
                      text: 'Simpan',
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        final UserBloc _userBLoc = context.read<UserBloc>();

                        final AuthBloc _authBloc = context.read<AuthBloc>();
                        _authBloc.add(GetAuth());

                        // check session & token
                        if (authState is AuthLoaded && authState.token != '') {
                          _userBLoc.add(UpdateUser(
                            name: _nameController.text,
                            email: authState.email,
                            phone: _phoneController.text,
                            password: _passwordController.text,
                            token: authState.token,
                          ));
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
