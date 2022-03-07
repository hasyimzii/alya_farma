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

class CartPage extends StatefulWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final AuthProvider provider = context.read<AuthProvider>();

    return Consumer<CartProvider>(
      builder: (
        BuildContext context,
        CartProvider cartProvider,
        Widget? child,
      ) {
        return FutureBuilder(
          future: CartApi.getCart(
            email: provider.email!,
            token: provider.token!,
          ),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.success) {
                if (snapshot.data.data.isNotEmpty) {
                  return _cartContent(context, provider, snapshot.data);
                } else {
                  return Center(
                    child: Text(
                      'Keranjang kosong!',
                      style: lightText(13),
                    ),
                  );
                }
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
      },
    );
  }

  Widget _cartContent(BuildContext context, AuthProvider provider, Cart cart) {
    final data = cart.data;
    final CartProvider cartProvider = context.read<CartProvider>();
    // add checkbox
    cartProvider.addCheck(data!.length);

    return Stack(
      children: [
        ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
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
                  token: provider.token!,
                );
              },
              onSub: () async {
                await cartProvider.subAmount(
                  id: data[index].cartId,
                  amount: data[index].amount,
                  token: provider.token!,
                );
              },
              onDelete: () async {
                await cartProvider.deleteCart(
                  id: data[index].cartId,
                  index: index,
                  token: provider.token!,
                );
              },
            );
          },
        ),
        _checkoutButton(context, cartProvider, data),
      ],
    );
  }

  Widget _checkoutButton(
    BuildContext context,
    CartProvider cartProvider,
    List<CartData> data,
  ) {
    if (data.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: SubmitButton(
          text: 'Checkout',
          onTap: () {
            final TransactionProvider transactionProvider =
                context.read<TransactionProvider>();

            // clear checkout
            transactionProvider.clearCheckout();

            for (var i = 0; i < data.length; i++) {
              if (cartProvider.check[i] == true) {
                // add checkout
                transactionProvider.addCheckout(data[i]);
                // set total
                transactionProvider.setTotal(
                  int.parse(data[i].amount),
                  int.parse(data[i].product.price),
                  int.parse(data[i].product.discount),
                );
              }
            }

            Navigator.pushNamed(
              context,
              '/transaction_page',
            );
          },
        ),
      );
    } else {
      return const Text('');
    }
  }
}
