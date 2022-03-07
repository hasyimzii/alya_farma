import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/style.dart';

import '../providers/auth_provider.dart';

import 'price.dart';

class GridContent extends StatelessWidget {
  const GridContent({
    Key? key,
    required this.image,
    required this.name,
    required this.category,
    required this.price,
    required this.discount,
    required this.onTapArgs,
  }) : super(key: key);

  final String image;
  final String name;
  final String category;
  final int price;
  final int discount;
  final Object onTapArgs;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: boxShadow(3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.0 / 1.0,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: titleText(14),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    category,
                    style: subtitleText(12),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 15),
                  Price(
                    price: price,
                    discount: discount,
                    priceStyle: priceText(15),
                    subpriceStyle: subpriceText(12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        final AuthProvider provider = context.read<AuthProvider>();
        if (provider.token != null) {
          Navigator.pushNamed(
            context,
            '/product_detail',
            arguments: onTapArgs,
          );
        } else {
          Navigator.pushNamed(
            context,
            '/login_page',
          );
        }
      },
    );
  }
}
