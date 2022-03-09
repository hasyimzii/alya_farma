part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class GetCategory extends CategoryEvent {}

class SearchCategory extends CategoryEvent {
  const SearchCategory({required this.category});

  final String category;

  @override
  List<Object> get props => [category];
}
