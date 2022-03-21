part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoaded extends TransactionState {
  const TransactionLoaded({
    required this.checkout,
    required this.paymentList,
    required this.payment,
    required this.total,
  });

  final List<CartData> checkout;
  final List<String> paymentList;
  final String payment;
  final int total;

  TransactionLoaded copyWith({
    String? payment,
    int? total,
  }) {
    return TransactionLoaded(
      checkout: checkout,
      paymentList: paymentList,
      payment: payment ?? this.payment,
      total: total ?? this.total,
    );
  }

  @override
  List<Object> get props => [checkout, paymentList, payment, total];
}

class HistoryLoaded extends TransactionState {
  const HistoryLoaded({
    required this.transaction,
    required this.message,
  });

  final List<TransactionData> transaction;
  final String message;

  @override
  List<Object> get props => [transaction, message];
}

class TransactionError extends TransactionState {}
