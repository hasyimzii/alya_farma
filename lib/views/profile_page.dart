import 'package:flutter/material.dart';
import '../common/style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Icons.person,
              color: whiteColor,
            ),
          ),
          title: Text(
            'Budi Gunawan',
            style: titleText(17),
          ),
          subtitle: Text(
            '081212344321',
            style: subtitleText(13),
          ),
          trailing: InkWell(
            child: Icon(
              Icons.edit,
              color: greyColor,
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
