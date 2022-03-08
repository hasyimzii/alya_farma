import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/style.dart';

import '../models/user.dart';
import '../services/user_api.dart';
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
          email: provider.email!,
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
                  return showModalBottomSheet(
                    context: context,
                    enableDrag: false,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (contex) => Column(
                      children: [
                        Text(
                          'Yakin mau keluar?',
                          style: titleText(13),
                        ),
                        ElevatedButton(
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
                          onPressed: () async {
                            await context.read<AuthProvider>().logout();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              '/main_page',
                              (Route<dynamic> route) => false,
                            );
                          },
                        ),
                        ElevatedButton(
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
                            primary: Colors.red[600],
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
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
