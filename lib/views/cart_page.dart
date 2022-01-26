import 'package:alya_farma/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/style.dart';

import '../providers/cart_provider.dart';

import '../widgets/cart_content.dart';
import '../widgets/submit_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<CartProvider, TransactionProvider>(
      builder: (
        BuildContext context,
        CartProvider cart,
        TransactionProvider transaction,
        Widget? child,
      ) {
        if (cart.cart.isNotEmpty) {
          return Stack(
            children: [
              ListView.builder(
                itemCount: cart.length,
                itemBuilder: (BuildContext context, int index) {
                  return CartContent(
                    checkValue: cart.cart[index].check,
                    onCheck: (value) {
                      cart.checkCart(index, value);
                    },
                    image: cart.cart[index].medic.image,
                    name: cart.cart[index].medic.name,
                    price: cart.cart[index].medic.price,
                    discount: cart.cart[index].medic.discount,
                    amount: cart.cart[index].amount,
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
                    onCheckout: () {},
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SubmitButton(
                  text: 'Checkout',
                  onTap: () {
                    transaction.addCheckout(cart.cart);
                    Navigator.pushNamed(
                      context,
                      '/transaction_page',
                    );
                  },
                ),
              ),
            ],
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
