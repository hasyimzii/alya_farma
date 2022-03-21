part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class AddCheckout extends TransactionEvent {
  const AddCheckout({
    required this.cart,
  });

  final List<CartData> cart;

  @override
  List<Object> get props => [cart];
}

class SetPayment extends TransactionEvent {
  const SetPayment({
    required this.payment,
  });

  final String payment;

  @override
  List<Object> get props => [payment];
}

class GetTransaction extends TransactionEvent {
  const GetTransaction({
    required this.email,
    required this.token,
  });

  final String email;
  final String token;

  @override
  List<Object> get props => [email, token];
}

class StoreTransaction extends TransactionEvent {
  const StoreTransaction({
    required this.checkout,
    required this.email,
    required this.token,
  });

  final List<CartData> checkout;
  final String email;
  final String token;

  @override
  List<Object> get props => [checkout, email, token];
}
