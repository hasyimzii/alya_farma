import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../config/style.dart';

import '../widgets/app_layout.dart';
import '../widgets/search_bar.dart';

class MedicDetail extends StatelessWidget {
  const MedicDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    final PanelController _panelController = PanelController();

    return AppLayout(
      radius: 0,
      controller: _searchController,
      onChanged: (value) {},
      onClear: () {
        _searchController.clear;
        FocusScope.of(context).unfocus();
      },
      body: SlidingUpPanel(
        controller: _panelController,
        parallaxEnabled: true,
        parallaxOffset: 0.2,
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
        header: Center(
          child: InkWell(
            child: Icon(
              Icons.maximize_rounded,
              size: 50,
              color: lightColor,
            ),
            onTap: () {
              _panelController.open();
            },
          ),
        ),
        panelBuilder: (controller) {
          return SingleChildScrollView(
            controller: controller,
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            child: Column(
              children: [
                Text(
                  'Produk A',
                  style: titleTextStyle,
                ),
                const SizedBox(height: 70),
                Text(
                  'Produk A',
                  style: titleTextStyle,
                ),
                const SizedBox(height: 70),
                Text(
                  'Produk A',
                  style: titleTextStyle,
                ),
                const SizedBox(height: 70),
                Text(
                  'Produk A',
                  style: titleTextStyle,
                ),
                const SizedBox(height: 70),
                Text(
                  'Produk A',
                  style: titleTextStyle,
                ),
                const SizedBox(height: 70),
                Text(
                  'Produk A',
                  style: titleTextStyle,
                ),
                const SizedBox(height: 70),
                Text(
                  'Produk A',
                  style: titleTextStyle,
                ),
                const SizedBox(height: 70),
                Text(
                  'Produk A',
                  style: titleTextStyle,
                ),
                const SizedBox(height: 70),
              ],
            ),
          );
        },
        footer: Center(
          child: ElevatedButton(
            child: Text('dasd'),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
