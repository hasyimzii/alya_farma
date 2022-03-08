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
  });

  final List<CartData> cart;

  @override
  List<Object> get props => [cart];
}

class CartError extends CartState {}
