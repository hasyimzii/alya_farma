import 'package:flutter/material.dart';
import '../common/style.dart';

import '../widgets/menu_content.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
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
            'Budi Gunawan',
            style: titleText(19),
          ),
          Text(
            '0812 1234 4321',
            style: subtitleText(14),
          ),
          const SizedBox(height: 30),
          MenuContent(
            icon: Icons.manage_accounts,
            title: 'Ubah Profil',
            onTap: () {},
          ),
          MenuContent(
            icon: Icons.location_on,
            title: 'Kelola Alamat',
            onTap: () {},
          ),
          MenuContent(
            icon: Icons.info,
            title: 'Tentang Kami',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
