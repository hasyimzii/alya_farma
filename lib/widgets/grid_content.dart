import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/style.dart';

import '../blocs/auth/auth_bloc.dart';

import 'price.dart';

class GridContent extends StatelessWidget {
  const GridContent({
    Key? key,
    required this.image,
    required this.name,
    required this.category,
    required this.price,
    required this.discount,
    required this.onTapArgs,
  }) : super(key: key);

  final String image;
  final String name;
  final String category;
  final int price;
  final int discount;
  final Object onTapArgs;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return InkWell(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: boxShadow(3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1.0 / 1.0,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: titleText(14),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        category,
                        style: subtitleText(12),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 15),
                      Price(
                        price: price,
                        discount: discount,
                        priceStyle: priceText(15),
                        subpriceStyle: subpriceText(12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            final AuthBloc _authBloc = context.read<AuthBloc>();
            _authBloc.add(GetAuth());

            // check session & token
            if (authState is AuthLoaded && authState.token != '') {
              Navigator.pushNamed(
                context,
                '/product_detail',
                arguments: onTapArgs,
              );
            } else {
              Navigator.pushNamed(
                context,
                '/login_page',
              );
            }
          },
        );
      },
    );
  }
}
