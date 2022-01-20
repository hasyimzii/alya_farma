import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/transaction_content.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return TransactionContent(
          image: 'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2020/10/3/eefb843f-53fa-4345-b1bc-946f15a42072.jpg',
          name: 'produk',
          price: 10000,
          amount: 2,
          onTapArgs: const <String, dynamic> {
            "medic": "lalal",
          },
          onBuy: () {},
        );
      },
    );
  }
}
