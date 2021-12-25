import 'package:flutter/material.dart';
import '../config/rupiah.dart';

class Price extends StatelessWidget {
  final int price;
  final int discount;
  final TextStyle priceStyle;
  final TextStyle subpriceStyle;

  const Price({
    Key? key,
    required this.price,
    required this.discount,
    required this.priceStyle,
    required this.subpriceStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (discount == 0) {
      return Text(
        Rupiah.convert(price),
        style: priceStyle,
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Rupiah.convert(discount),
            style: priceStyle,
          ),
          Text(
            Rupiah.convert(price),
            style: subpriceStyle,
          ),
        ],
      );
    }
  }
}
