import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/style.dart';

import '../models/product.dart';
import '../providers/cart_provider.dart';

import '../widgets/app_layout.dart';
import '../widgets/detail_content.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // define arguments
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    ProductData product = args['product'];

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
            code: product.code,
            name: product.name,
            category: product.category,
            unit: product.unit,
            amount: int.parse(product.amount),
            price: int.parse(product.price),
            discount: int.parse(product.discount),
            image: product.image,
            description: product.description,
            onTap: () {
              cart.addCart(product);
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
