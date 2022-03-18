import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/style.dart';

import '../models/product.dart';

import '../blocs/auth/auth_bloc.dart';
import '../blocs/cart/cart_bloc.dart';

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
      body: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartLoaded) {
            // set dialog snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                content: Text(state.message),
              ),
            );
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
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
              onTap: () async {
                final CartBloc _cartBloc = context.read<CartBloc>();

                final AuthBloc _authBloc = context.read<AuthBloc>();
                _authBloc.add(GetAuth());

                // check session & token
                if (authState is AuthLoaded && authState.token != '') {
                  _cartBloc.add(StoreCart(
                    productId: product.code,
                    email: authState.email,
                    token: authState.token,
                  ));
                }
              },
            );
          },
        ),
      ),
    );
  }
}
