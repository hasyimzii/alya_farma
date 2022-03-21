import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/cart.dart';
import '../../models/transaction.dart';
import '../../services/transaction_api.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    Transaction transaction;
    List<CartData> checkout = [];
    List<String> paymentList = ['GoPay', 'OVO', 'Dana', 'Link Aja'];
    String payment;
    int total;

    on<AddCheckout>((event, emit) {
      // initiate
      checkout.clear();
      payment = 'Pilih Pembayaran';
      total = 0;

      for (CartData data in event.cart) {
        if (data.check == true) {
          // add cart
          checkout.add(data);

          // parsing int
          int discount = int.parse(data.product.discount);
          int price = int.parse(data.product.price);
          int amount = int.parse(data.product.amount);

          // counting total
          if (discount == 0) {
            int count = amount * price;
            total += count;
          } else {
            int count = amount * discount;
            total += count;
          }
        }
      }

      emit(TransactionLoaded(
        checkout: checkout,
        paymentList: paymentList,
        payment: payment,
        total: total,
      ));
    });

    on<SetPayment>((event, emit) {
      TransactionLoaded transactionLoaded = state as TransactionLoaded;
      emit(transactionLoaded.copyWith(payment: event.payment));
    });

    on<GetTransaction>((event, emit) async {
      try {
        transaction = await TransactionApi.getTransaction(
          email: event.email,
          token: event.token,
        );

        emit(HistoryLoaded(
          transaction: transaction.data!,
          message: transaction.message,
        ));
      } catch (e) {
        emit(TransactionError());
      }
    });

    on<StoreTransaction>((event, emit) async {
      List<Map<String, dynamic>> cart = [];
      // looping cart
      for (CartData data in event.checkout) {
        // count price & discount
        int priceCount = 0;
        int discount = int.parse(data.product.discount);
        int price = int.parse(data.product.price);

        if (discount == 0) {
          priceCount = price;
        } else {
          priceCount = discount;
        }

        Map<String, dynamic> cartDetail = {
          'cart_id': data.cartId,
          'code': data.product.code,
          'amount': data.amount,
          'price': priceCount,
        };

        cart.add(cartDetail);
      }

      try {
        Map<String, dynamic> data = {
          'cart': cart,
          'email': event.email,
        };
        transaction = await TransactionApi.storeTransaction(
          data: data,
          token: event.token,
        );

        emit(HistoryLoaded(
          transaction: transaction.data!,
          message: transaction.message,
        ));
      } catch (e) {
        emit(TransactionError());
      }
    });
  }
}
