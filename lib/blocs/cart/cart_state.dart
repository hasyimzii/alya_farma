part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  const CartLoaded({
    required this.cart,
    required this.message,
  });

  final List<CartData> cart;
  final String message;

  @override
  List<Object> get props => [cart, message];
}

class CartError extends CartState {}
