import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/style.dart';
import '../common/rupiah.dart';

import '../providers/transaction_provider.dart';

import '../widgets/app_layout.dart';
import '../widgets/transaction_content.dart';
import '../widgets/menu_content.dart';
import '../widgets/submit_button.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TransactionProvider provider = context.read<TransactionProvider>();

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
              itemCount: provider.checkout.length,
              itemBuilder: (BuildContext context, int index) {
                return TransactionContent(
                  image: provider.checkout[index].product.image,
                  name: provider.checkout[index].product.name,
                  price: int.parse(provider.checkout[index].product.price),
                  discount: int.parse(provider.checkout[index].product.discount),
                  amount: int.parse(provider.checkout[index].amount),
                );
              },
            ),
          ),
          Column(
            children: [
              MenuContent(
                icon: Icons.payment_rounded,
                title: provider.payment,
                onTap: () => showModalBottomSheet(
                  context: context,
                  enableDrag: false,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (contex) => ListView.builder(
                    padding: const EdgeInsets.only(top: 15),
                    itemCount: provider.payment.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MenuContent(
                        icon: Icons.payment_rounded,
                        title: provider.paymentList[index],
                        onTap: () {
                          provider.setPayment(
                            provider.paymentList[index],
                          );
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
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
                      Rupiah.convert(provider.total),
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
