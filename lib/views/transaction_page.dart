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
    return AppLayout(
      searchBar: false,
      title: Text(
        'Beli Produk',
        style: titleText(15),
      ),
      body: Consumer<TransactionProvider>(
        builder: (
          BuildContext context,
          TransactionProvider transaction,
          Widget? child,
        ) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: transaction.checkoutLength,
                  itemBuilder: (BuildContext context, int index) {
                    return TransactionContent(
                      image: transaction.checkout[index].medic.image,
                      name: transaction.checkout[index].medic.name,
                      price: transaction.checkout[index].medic.price,
                      amount: transaction.checkout[index].amount,
                    );
                  },
                ),
              ),
              Column(
                children: [
                  MenuContent(
                    icon: Icons.payment_rounded,
                    title: transaction.payment,
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
                        itemCount: transaction.paymentLength,
                        itemBuilder: (BuildContext context, int index) {
                          return MenuContent(
                            icon: Icons.payment_rounded,
                            title: transaction.paymentList[index],
                            onTap: () {
                              transaction.setPayment(
                                transaction.paymentList[index],
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
          );
        },
      ),
    );
  }
}
