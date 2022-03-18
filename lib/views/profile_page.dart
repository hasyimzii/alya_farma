import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/style.dart';

import '../models/user.dart';

import '../blocs/auth/auth_bloc.dart';
import '../blocs/user/user_bloc.dart';
import '../blocs/navigation/navigation_cubit.dart';

import '../widgets/menu_content.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          return BlocBuilder<UserBloc, UserState>(
            builder: (BuildContext context, UserState state) {
              final UserBloc _userBloc = context.read<UserBloc>();

              final AuthBloc _authBloc = context.read<AuthBloc>();
              _authBloc.add(GetAuth());

              // check session & token & state
              if (authState is AuthLoaded &&
                  authState.token != '' &&
                  state is! UserLoaded) {
                _userBloc.add(GetUser(
                  email: authState.email,
                  token: authState.token,
                ));
              }

              if (state is UserLoaded) {
                if (state.user.email != '') {
                  return _profileContent(context, state);
                } else {
                  return Center(
                    child: Text(
                      'Data kosong!',
                      style: lightText(13),
                    ),
                  );
                }
              } else if (state is UserError) {
                return Center(
                  child: Text(
                    'Terjadi kesalahan!',
                    style: lightText(13),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            },
          );
        },
      ),
    );
  }

  Widget _profileContent(BuildContext context, UserLoaded userLoaded) {
    final UserData _user = userLoaded.user;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: blueColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(
            Icons.person,
            color: whiteColor,
            size: 60,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          _user.name,
          style: titleText(19),
        ),
        Text(
          _user.email,
          style: subtitleText(14),
        ),
        Text(
          _user.phone,
          style: subtitleText(13),
        ),
        const SizedBox(height: 30),
        MenuContent(
          icon: Icons.manage_accounts,
          title: 'Ubah Profil',
          onTap: () {
            Navigator.pushNamed(
              context,
              '/profile_edit',
              arguments: {
                'user': _user,
              },
            );
          },
        ),
        // MenuContent(
        //   icon: Icons.location_on,
        //   title: 'Kelola Alamat',
        //   onTap: () {},
        // ),
        MenuContent(
          icon: Icons.info,
          title: 'Tentang Kami',
          onTap: () {
            Navigator.pushNamed(
              context,
              '/about_page',
            );
          },
        ),
        MenuContent(
          icon: Icons.logout,
          title: 'Keluar',
          onTap: () async {
            return _logoutModal(context);
          },
        ),
      ],
    );
  }

  Future _logoutModal(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (contex) => SizedBox(
        height: 180,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              'Yakin ingin keluar?',
              style: titleText(17),
            ),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 1,
                horizontal: 25,
              ),
              width: double.infinity,
              child: ElevatedButton(
                child: Text(
                  'Keluar',
                  style: whiteText(13),
                ),
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  primary: Colors.red[600],
                ),
                onPressed: () {
                  final AuthBloc _authBloc = context.read<AuthBloc>();
                  _authBloc.add(Logout());

                  final NavigationCubit _navigation =
                      context.read<NavigationCubit>();

                  _navigation.setScreen(0);

                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/main_page',
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 1,
                horizontal: 25,
              ),
              width: double.infinity,
              child: ElevatedButton(
                child: Text(
                  'Batal',
                  style: whiteText(13),
                ),
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  primary: greyColor,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
