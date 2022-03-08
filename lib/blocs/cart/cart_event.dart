part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetCart extends CartEvent {
  const GetCart({
    required this.email,
    required this.token,
  });

  final String email;
  final String token;

  @override
  List<Object> get props => [email, token];
}

class StoreCart extends CartEvent {
  const StoreCart({
    required this.productId,
    required this.email,
    required this.token,
  });

  final String productId;
  final String email;
  final String token;

  @override
  List<Object> get props => [productId, email, token];
}

class CheckCart extends CartEvent {
  const CheckCart({
    required this.index,
    required this.value,
  });

  final int index;
  final bool value;

  @override
  List<Object> get props => [index, value];
}

class AddAmountCart extends CartEvent {
  const AddAmountCart({
    required this.id,
    required this.index,
    required this.token,
  });

  final int id;
  final int index;
  final String token;

  @override
  List<Object> get props => [id, index, token];
}

class SubAmountCart extends CartEvent {
  const SubAmountCart({
    required this.id,
    required this.index,
    required this.amount,
    required this.token,
  });

  final int id;
  final int index;
  final String amount;
  final String token;

  @override
  List<Object> get props => [id, index, amount, token];
}

class DeleteCart extends CartEvent {
  const DeleteCart({
    required this.id,
    required this.index,
    required this.token,
  });

  final int id;
  final int index;
  final String token;

  @override
  List<Object> get props => [id, index, token];
}
