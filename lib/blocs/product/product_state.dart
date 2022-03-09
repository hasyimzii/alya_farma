part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoaded extends ProductState {
  const ProductLoaded({
    required this.product,
    required this.message,
  });

  final List<ProductData> product;
  final String message;

  @override
  List<Object> get props => [product, message];
}

class ProductError extends ProductState {}
