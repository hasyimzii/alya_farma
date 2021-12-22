import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../config/style.dart';
import '../config/rupiah.dart';

import '../widgets/app_layout.dart';

class MedicDetail extends StatelessWidget {
  const MedicDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    return AppLayout(
      radius: 0,
      controller: _searchController,
      onChanged: (value) {},
      onClear: () {
        _searchController.clear;
        FocusScope.of(context).unfocus();
      },
      body: Stack(
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
                    'assets/images/product.png',
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
                          'Produk Obat Perut',
                          style: titleTextStyle,
                        ),
                        Text(
                          'Kategori A',
                          style: subtitleTextStyle,
                        ),
                        const SizedBox(height: 10),
                        _price(10000, 100000),
                        const SizedBox(height: 10),
                        Text(
                          'Stok:  150 pcs',
                          style: titleListTextStyle,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Deskripsi',
                          style: titleListTextStyle,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
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
      ),
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
            Rupiah.convert(price),
            style: priceTextStyle,
          ),
          Text(
            Rupiah.convert(discount),
            style: discountTextStyle,
          ),
        ],
      );
    }
  }
}
