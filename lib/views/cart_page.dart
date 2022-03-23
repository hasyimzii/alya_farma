import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/style.dart';

import '../models/cart.dart';

import '../blocs/auth/auth_bloc.dart';
import '../blocs/cart/cart_bloc.dart';
import '../blocs/transaction/transaction_bloc.dart';

import '../widgets/cart_content.dart';
import '../widgets/submit_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return BlocBuilder<CartBloc, CartState>(
          builder: (BuildContext context, CartState state) {
            final AuthBloc _authBloc = context.read<AuthBloc>();
            _authBloc.add(GetAuth());

            // check session & token & state
            if (authState is AuthLoaded &&
                authState.token != '' &&
                state is! CartLoaded) {
              final CartBloc _cartBloc = context.read<CartBloc>();
              _cartBloc.add(GetCart(
                email: authState.email,
                token: authState.token,
              ));
            }

            if (authState is AuthLoaded && state is CartLoaded) {
              if (state.cart.isNotEmpty) {
                return _cartContent(context, state, authState);
              } else {
                return Center(
                  child: Text(
                    'Keranjang kosong!',
                    style: lightText(13),
                  ),
                );
              }
            } else if (state is CartError) {
              return Center(
                child: Text(
                  'Terjadi kesalahan!',
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

  Widget _cartContent(
    BuildContext context,
    CartLoaded cartLoaded,
    AuthLoaded authState,
  ) {
    final List<CartData> _cart = cartLoaded.cart;
    final CartBloc _cartBloc = context.read<CartBloc>();

    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () async => context.read<CartBloc>().add(GetCart(
                email: authState.email,
                token: authState.token,
              )),
          child: ListView.builder(
            itemCount: _cart.length,
            itemBuilder: (BuildContext context, int index) {
              return CartContent(
                checkValue: _cart[index].check,
                onCheck: (value) {
                  _cartBloc.add(CheckCart(index: index, value: value));
                },
                image: _cart[index].product.image,
                name: _cart[index].product.name,
                price: int.parse(_cart[index].product.price),
                discount: int.parse(_cart[index].product.discount),
                amount: int.parse(_cart[index].amount),
                onTapArgs: <String, dynamic>{
                  'product': _cart[index].product,
                },
                onAdd: () {
                  _cartBloc.add(AddAmountCart(
                    id: _cart[index].cartId,
                    index: index,
                    token: authState.token,
                  ));
                },
                onSub: () {
                  _cartBloc.add(SubAmountCart(
                    id: _cart[index].cartId,
                    index: index,
                    amount: _cart[index].amount,
                    token: authState.token,
                  ));
                },
                onDelete: () {
                  _cartBloc.add(DeleteCart(
                    id: _cart[index].cartId,
                    index: index,
                    token: authState.token,
                  ));
                },
              );
            },
          ),
        ),
        _checkoutButton(context, _cart),
      ],
    );
  }

  Widget _checkoutButton(
    BuildContext context,
    List<CartData> cart,
  ) {
    if (cart.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: SubmitButton(
          text: 'Checkout',
          onTap: () {
            final TransactionBloc _transactionBloc =
                context.read<TransactionBloc>();
            _transactionBloc.add(AddCheckout(cart: cart));

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
