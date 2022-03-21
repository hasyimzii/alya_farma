import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/style.dart';

import '../models/transaction.dart';

import '../blocs/auth/auth_bloc.dart';
import '../blocs/transaction/transaction_bloc.dart';
import '../blocs/cart/cart_bloc.dart';

import '../widgets/history_content.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return BlocBuilder<TransactionBloc, TransactionState>(
          builder: (BuildContext context, TransactionState state) {
            final AuthBloc _authBloc = context.read<AuthBloc>();
            _authBloc.add(GetAuth());

            // check session & token & state
            if (authState is AuthLoaded &&
                authState.token != '' &&
                state is! HistoryLoaded) {
              final TransactionBloc _transactionBloc =
                  context.read<TransactionBloc>();
              _transactionBloc.add(GetTransaction(
                email: authState.email,
                token: authState.token,
              ));
            }

            if (authState is AuthLoaded && state is HistoryLoaded) {
              if (state.transaction.isNotEmpty) {
                return _transactionContent(context, state, authState);
              } else {
                return Center(
                  child: Text(
                    'Belum melakukan transaksi!',
                    style: lightText(13),
                  ),
                );
              }
            } else if (state is TransactionError) {
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

  Widget _transactionContent(
    BuildContext context,
    HistoryLoaded transactionLoaded,
    AuthLoaded authState,
  ) {
    final List<TransactionData> _transaction = transactionLoaded.transaction;

    return BlocListener<CartBloc, CartState>(
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
      child: RefreshIndicator(
        onRefresh: () async =>
            context.read<TransactionBloc>().add(GetTransaction(
                  email: authState.email,
                  token: authState.token,
                )),
        child: ListView.builder(
          itemCount: _transaction.length,
          itemBuilder: (BuildContext context, int index) {
            return HistoryContent(
              date: _transaction[index].date,
              image: _transaction[index].product.image,
              name: _transaction[index].product.name,
              price: int.parse(_transaction[index].price),
              amount: int.parse(_transaction[index].amount),
              onTapArgs: <String, dynamic>{
                'product': _transaction[index].product,
              },
              onBuy: () async {
                final CartBloc _cartBloc = context.read<CartBloc>();

                final AuthBloc _authBloc = context.read<AuthBloc>();
                _authBloc.add(GetAuth());

                // check session & token
                if (authState.token != '') {
                  // store api
                  _cartBloc.add(StoreCart(
                    productId: _transaction[index].product.code,
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
