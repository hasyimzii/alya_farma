import 'package:flutter/material.dart';
import '../common/style.dart';
import '../common/rupiah.dart';

import 'price.dart';

class TransactionContent extends StatelessWidget {
  const TransactionContent({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.discount,
    required this.amount,
  }) : super(key: key);

  final String image;
  final String name;
  final int price;
  final int discount;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: boxShadow(3),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: AspectRatio(
            aspectRatio: 1.0 / 1.0,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          name,
          style: titleText(15),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        subtitle: _priceRow(),
        trailing: Text(
          '${amount}x',
          style: lightText(13),
        ),
      ),
    );
  }

  Widget _priceRow() {
    if (discount == 0) {
      return Text(
        Rupiah.convert(price),
        style: priceText(13),
      );
    } else {
      return Price(
        price: price,
        discount: discount,
        priceStyle: priceText(13),
        subpriceStyle: subpriceText(10),
      );
    }
  }
}
