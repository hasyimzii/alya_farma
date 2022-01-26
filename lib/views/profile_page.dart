import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/style.dart';

import '../providers/user_provider.dart';

import '../widgets/menu_content.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Consumer<UserProvider>(
        builder: (
          BuildContext context,
          UserProvider user,
          Widget? child,
        ) {
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
                user.user.name,
                style: titleText(19),
              ),
              Text(
                user.user.email,
                style: subtitleText(14),
              ),
              Text(
                user.user.phone,
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
                    arguments: 'onTapArgs',
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
            ],
          );
        },
      ),
    );
  }
}
