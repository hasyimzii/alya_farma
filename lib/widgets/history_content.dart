import 'package:flutter/material.dart';
import '../utils/style.dart';
import '../utils/rupiah.dart';

class HistoryContent extends StatelessWidget {
  const HistoryContent({
    Key? key,
    required this.date,
    required this.image,
    required this.name,
    required this.price,
    required this.amount,
    required this.onTapArgs,
    required this.onBuy,
  }) : super(key: key);

  final String date;
  final String image;
  final String name;
  final int price;
  final int amount;
  final Object onTapArgs;
  final VoidCallback onBuy;

  @override
  Widget build(BuildContext context) {
    final int totalPrice = price * amount;

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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            child: Text(
              date,
              style: lightText(10),
            ),
          ),
          ListTile(
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
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Total Belanja',
                      style: lightText(10),
                    ),
                    Text(
                      Rupiah.convert(totalPrice),
                      style: titleText(12),
                    ),
                  ],
                ),
                ElevatedButton(
                  child: Text(
                    'Beli Lagi',
                    style: whiteText(10),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(75, 8),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    primary: greenColor,
                  ),
                  onPressed: onBuy,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
