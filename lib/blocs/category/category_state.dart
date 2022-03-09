part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoaded extends CategoryState {
  const CategoryLoaded({
    required this.category,
    required this.message,
  });

  final List<CategoryData> category;
  final String message;

  @override
  List<Object> get props => [category, message];
}

class CategoryResult extends CategoryState {
  const CategoryResult({
    required this.product,
    required this.message,
  });

  final List<ProductData> product;
  final String message;

  @override
  List<Object> get props => [product, message];
}

class CategoryError extends CategoryState {}
