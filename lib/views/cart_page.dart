import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/style.dart';

import '../models/cart.dart';
import '../network/cart_api.dart';

import '../providers/auth_provider.dart';
import '../providers/cart_provider.dart';
import '../providers/transaction_provider.dart';

import '../widgets/cart_content.dart';
import '../widgets/submit_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthProvider provider = context.read<AuthProvider>();

    return FutureBuilder(
      future: CartApi.getCart(email: provider.email!),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.success) {
            return _cartContent(context, snapshot.data);
          } else {
            return Center(
              child: Text(
                snapshot.data.message,
                style: lightText(13),
              ),
            );
          }
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Something went wrong!',
              style: lightText(13),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }

  Widget _cartContent(BuildContext context, Cart cart) {
    final data = cart.data;
    final CartProvider cartProvider = context.read<CartProvider>();

    return Stack(
      children: [
        ListView.builder(
          itemCount: data!.length,
          itemBuilder: (BuildContext context, int index) {
            // add checkbox
            cartProvider.addCheck(data.length);

            return CartContent(
              checkValue: cartProvider.check[index],
              onCheck: (value) {
                cartProvider.checkCart(index, value);
              },
              image: data[index].product.image,
              name: data[index].product.name,
              price: int.parse(data[index].product.price),
              discount: int.parse(data[index].product.discount),
              amount: int.parse(data[index].amount),
              onTapArgs: <String, dynamic>{
                'product': data[index].product,
              },
              onAdd: () async {
                await cartProvider.addAmount(
                  id: data[index].cartId,
                );
              },
              onSub: () async {
                await cartProvider.subAmount(
                  id: data[index].cartId,
                  amount: data[index].amount,
                );
              },
              onDelete: () async {
                await cartProvider.deleteCart(
                  id: data[index].cartId,
                  index: index,
                );
              },
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: SubmitButton(
            text: 'Checkout',
            onTap: () {
              // transaction.addCheckout(cart.cart, cart.check);
              Navigator.pushNamed(
                context,
                '/transaction_page',
              );
            },
          ),
        ),
      ],
    );
  }
}
