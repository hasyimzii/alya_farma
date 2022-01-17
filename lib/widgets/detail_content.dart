import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../common/style.dart';

import 'price.dart';
import 'submit_button.dart';

class DetailContent extends StatelessWidget {
  final String code;
  final String name;
  final String category;
  final String unit;
  final int stock;
  final int price;
  final int discount;
  final String image;
  final String description;
  final VoidCallback onTap;

  const DetailContent({
    Key? key,
    required this.code,
    required this.name,
    required this.category,
    required this.unit,
    required this.stock,
    required this.price,
    required this.discount,
    required this.image,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SlidingUpPanel(
          parallaxEnabled: true,
          parallaxOffset: 0.2,
          padding: const EdgeInsets.symmetric(vertical: 10),
          minHeight: MediaQuery.of(context).size.height * 0.4,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          body: Positioned(
            top: -1000.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          header: Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(7),
              ),
            ),
            child: Center(
              child: Container(
                width: 30,
                height: 4,
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          panelBuilder: (controller) {
            return Stack(
              children: [
                SingleChildScrollView(
                  controller: controller,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: titleText(16),
                      ),
                      Text(
                        category,
                        style: subtitleText(13),
                      ),
                      const SizedBox(height: 10),
                      Price(
                        price: price,
                        discount: discount,
                        priceStyle: priceText(18),
                        subpriceStyle: subpriceText(13),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Stok:  $stock $unit',
                        style: titleText(14),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Deskripsi',
                        style: titleText(14),
                      ),
                      Text(
                        description,
                        style: lightText(13),
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        SubmitButton(
          text: '+ Keranjang',
          onTap: onTap,
        ),
      ],
    );
  }
}
