import 'package:flutter/material.dart';
import '../common/style.dart';
import '../common/rupiah.dart';

class TransactionContent extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final int amount;

  const TransactionContent({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.amount,
  }) : super(key: key);

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
        subtitle: Text(
          Rupiah.convert(price),
          style: priceText(13),
        ),
        trailing: Text(
          '${amount}x',
          style: lightText(13),
        ),
      ),
    );
  }
}
