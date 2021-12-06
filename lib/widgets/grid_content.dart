import 'package:flutter/material.dart';
import '../config/style.dart';

class GridContent extends StatelessWidget {
  final String title;
  final String subtitle;

  const GridContent({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      child: Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.0 / 1.0,
              child: Image.asset(
                'assets/images/product.png',
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: Text(
                title,
                style: titleListTextStyle,
              ),
              subtitle: Text(
                subtitle,
                style: subtitleListTextStyle,
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
