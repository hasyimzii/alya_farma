import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/style.dart';

import '../providers/cart_provider.dart';

import '../widgets/cart_content.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (
        BuildContext context,
        CartProvider cart,
        Widget? child,
      ) {
        if (cart.cart.isNotEmpty) {
          return ListView.builder(
            itemCount: cart.length,
            itemBuilder: (BuildContext context, int index) {
              return CartContent(
                checkValue: cart.check[index],
                onCheck: (value) {
                  cart.checkCart(index, value);
                },
                image: cart.cart[index].medic.image,
                name: cart.cart[index].medic.name,
                price: cart.cart[index].medic.price,
                discount: cart.cart[index].medic.discount,
                amount: cart.amount[index],
                onTapArgs: <String, dynamic>{
                  'medic': cart.cart[index].medic,
                },
                onAdd: () {
                  cart.addAmount(index);
                },
                onSub: () {
                  cart.subAmount(index);
                },
                onDelete: () {
                  cart.deleteCart(index);
                },
              );
            },
          );
        } else {
          return Center(
            child: Text(
              'Keranjang kosong!',
              style: subtitleText(15),
            ),
          );
        }
      },
    );
  }
}
