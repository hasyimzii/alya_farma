import 'package:flutter/material.dart';
import '../common/style.dart';
import '../common/rupiah.dart';

import '../widgets/app_layout.dart';
import '../widgets/transaction_content.dart';
import '../widgets/submit_button.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      searchBar: false,
      title: Text(
        'Beli Produk',
        style: titleText(15),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return const TransactionContent(
                  image:
                      'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2020/10/3/eefb843f-53fa-4345-b1bc-946f15a42072.jpg',
                  name: 'produk',
                  price: 10000,
                  amount: 2,
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: subtitleText(16),
                    ),
                    Text(
                      Rupiah.convert(10000),
                      style: titleText(16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SubmitButton(
              text: 'Konfirmasi Pembelian',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
