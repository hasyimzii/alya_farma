import 'package:flutter/material.dart';
import '../config/style.dart';
import '../config/rupiah.dart';

class GridContent extends StatelessWidget {
  final String title;
  final String category;
  final int price;
  final int discount;

  const GridContent({
    Key? key,
    required this.title,
    required this.category,
    required this.price,
    required this.discount,
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
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: titleListTextStyle,
                  ),
                  Text(
                    category,
                    style: subtitleListTextStyle,
                  ),
                  _price(price, discount),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }

  Widget _price(int price, int discount) {
    if (discount == 0) {
      return Text(
        Rupiah.convert(price),
        style: priceListTextStyle,
      );
    } else {
      return ListTile(
        title: Text(
          Rupiah.convert(price),
          style: priceListTextStyle,
        ),
        subtitle: Text(
          Rupiah.convert(discount),
          style: discountListTextStyle,
        ),
      );
    }
  }
}
