part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProduct extends ProductEvent {}

class SearchProduct extends ProductEvent {
  const SearchProduct({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}
