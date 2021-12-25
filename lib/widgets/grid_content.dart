import 'package:flutter/material.dart';
import '../config/style.dart';

import 'price.dart';

class GridContent extends StatelessWidget {
  final String image;
  final String name;
  final String category;
  final int price;
  final int discount;
  final Object onTapArgs;

  const GridContent({
    Key? key,
    required this.image,
    required this.name,
    required this.category,
    required this.price,
    required this.discount,
    required this.onTapArgs,
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
                    style: titleListTextStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    category,
                    style: subtitleListTextStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 15),
                  Price(
                    price: price,
                    discount: discount,
                    priceStyle: priceListTextStyle,
                    subpriceStyle: subpriceListTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/medic_detail',
          arguments: onTapArgs,
        );
      },
    );
  }
}
