import 'package:flutter/material.dart';
import '../common/style.dart';

class MenuContent extends StatelessWidget {
  const MenuContent({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: ListTile(
            leading: Icon(
              icon,
              color: greyColor,
              size: 30,
            ),
            title: Text(
              title,
              style: titleText(15),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: greyColor,
              size: 15,
            ),
          ),
          onTap: onTap,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Divider(
            height: 1,
            thickness: 0.7,
          ),
        ),
      ],
    );
  }
}
