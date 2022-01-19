import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/style.dart';

import '../models/medic.dart';
import '../providers/cart_provider.dart';

import '../widgets/app_layout.dart';
import '../widgets/detail_content.dart';

class MedicDetail extends StatelessWidget {
  const MedicDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // define arguments
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    Medic? medic = args['medic'];

    return AppLayout(
      searchBar: false,
      title: Text(
        'Detail Produk',
        style: titleText(15),
      ),
      body: Consumer<CartProvider>(
        builder: (
          BuildContext context,
          CartProvider cart,
          Widget? child,
        ) {
          return DetailContent(
            code: medic!.code,
            name: medic.name,
            category: medic.category,
            unit: medic.unit,
            stock: medic.stock,
            price: medic.price,
            discount: medic.discount,
            image: medic.image,
            description: medic.description,
            onTap: () {
              cart.addCart(medic);
              // set dialog snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 1),
                  content: Text(cart.messagge),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
