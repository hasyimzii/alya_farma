import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/cart_content.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartContent(
          checkValue: false,
          onCheck: (value) {},
          image: 'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2020/10/3/eefb843f-53fa-4345-b1bc-946f15a42072.jpg',
          name: 'Product',
          price: 13000,
          quantity: 1,
          onAdd: () {},
          onSub: () {},
          onDelete: () {},
        ),
      ],
    );
  }
}
