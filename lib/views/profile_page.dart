import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/style.dart';
import '../common/crypt.dart';

import '../models/user.dart';
import '../network/user_api.dart';
import '../providers/auth_provider.dart';

import '../widgets/menu_content.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthProvider provider = context.read<AuthProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: FutureBuilder(
        future: UserApi.getUser(
          email: Crypt.encode(provider.email!),
          token: provider.token!,
        ),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final UserData data = snapshot.data.data;
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
                data.name,
                style: titleText(19),
              ),
              Text(
                data.email,
                style: subtitleText(14),
              ),
              Text(
                data.phone,
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
                      'user': data,
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
                  await context.read<AuthProvider>().logout();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/main_page',
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
