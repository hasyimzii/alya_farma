import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/style.dart';
import '../utils/rupiah.dart';

import '../blocs/auth/auth_bloc.dart';
import '../blocs/transaction/transaction_bloc.dart';

import '../widgets/app_layout.dart';
import '../widgets/transaction_content.dart';
import '../widgets/menu_content.dart';
import '../widgets/submit_button.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        TransactionLoaded _transaction = state as TransactionLoaded;
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
                  itemCount: _transaction.checkout.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TransactionContent(
                      image: _transaction.checkout[index].product.image,
                      name: _transaction.checkout[index].product.name,
                      price:
                          int.parse(_transaction.checkout[index].product.price),
                      discount: int.parse(
                          _transaction.checkout[index].product.discount),
                      amount: int.parse(_transaction.checkout[index].amount),
                    );
                  },
                ),
              ),
              Column(
                children: [
                  MenuContent(
                    icon: Icons.payment_rounded,
                    title: _transaction.payment,
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
                        itemCount: _transaction.paymentList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MenuContent(
                            icon: Icons.payment_rounded,
                            title: _transaction.paymentList[index],
                            onTap: () {
                              final TransactionBloc _transactionBloc =
                                  context.read<TransactionBloc>();
                              _transactionBloc.add(SetPayment(
                                payment: _transaction.paymentList[index],
                              ));
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
                          Rupiah.convert(_transaction.total),
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
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, authState) {
                    return SubmitButton(
                      text: 'Konfirmasi Pembelian',
                      onTap: () {
                        final AuthBloc _authBloc = context.read<AuthBloc>();
                        _authBloc.add(GetAuth());

                        if (authState is AuthLoaded && authState.token != '') {
                          final TransactionBloc _transactionBloc =
                              context.read<TransactionBloc>();
                          _transactionBloc.add(StoreTransaction(
                            checkout: _transaction.checkout,
                            email: authState.email,
                            token: authState.token,
                          ));
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
