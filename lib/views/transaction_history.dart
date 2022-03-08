import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/style.dart';

import '../models/transaction.dart';
import '../models/cart.dart';

import '../services/transaction_api.dart';

import '../providers/cart_provider.dart';
import '../providers/auth_provider.dart';

import '../widgets/history_content.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthProvider provider = context.read<AuthProvider>();

    return FutureBuilder(
      future: TransactionApi.getTransaction(
        email: provider.email!,
        token: provider.token!,
      ),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.success) {
            if (snapshot.data.data.isNotEmpty) {
              return _transactionContent(snapshot.data);
            } else {
              return Center(
                child: Text(
                  'Belum melakukan transaksi!',
                  style: lightText(13),
                ),
              );
            }
          } else {
            return Center(
              child: Text(
                snapshot.data.message,
                style: lightText(13),
              ),
            );
          }
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Something went wrong!',
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
  }

  Widget _transactionContent(Transaction transaction) {
    final data = transaction.data;

    return ListView.builder(
      itemCount: data!.length,
      itemBuilder: (BuildContext context, int index) {
        return HistoryContent(
          date: data[index].date,
          image: data[index].product.image,
          name: data[index].product.name,
          price: int.parse(data[index].price),
          amount: int.parse(data[index].amount),
          onTapArgs: <String, dynamic>{
            'product': data[index].product,
          },
          onBuy: () async {
            final AuthProvider authProvider = context.read<AuthProvider>();
            final CartProvider cartProvider = context.read<CartProvider>();

            // store api
            Cart result = await cartProvider.storeCart(
              email: authProvider.email!,
              productId: data[index].product.code,
              token: authProvider.token!,
            );

            // set dialog snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                content: Text(result.message),
              ),
            );
          },
        );
      },
    );
  }
}
