import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../config/style.dart';
import '../config/rupiah.dart';

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
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          header: Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.44,
            ),
            child: Center(
              child: Icon(
                Icons.maximize_rounded,
                size: 30,
                color: lightColor,
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
                        style: titleTextStyle,
                      ),
                      Text(
                        category,
                        style: subtitleTextStyle,
                      ),
                      const SizedBox(height: 10),
                      _price(price, discount),
                      const SizedBox(height: 10),
                      Text(
                        'Stok:  $stock $unit',
                        style: titleListTextStyle,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Deskripsi',
                        style: titleListTextStyle,
                      ),
                      Text(
                        description,
                        style: subtitleListTextStyle,
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.all(15),
            width: double.infinity,
            child: ElevatedButton(
              child: const Text('+ Keranjang'),
              style: ElevatedButton.styleFrom(
                primary: greenColor,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  Widget _price(int price, int discount) {
    if (discount == 0) {
      return Text(
        Rupiah.convert(price),
        style: priceTextStyle,
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Rupiah.convert(discount),
            style: priceTextStyle,
          ),
          Text(
            Rupiah.convert(price),
            style: discountTextStyle,
          ),
        ],
      );
    }
  }
}
