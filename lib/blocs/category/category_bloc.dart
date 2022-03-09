import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/category.dart';
import '../../models/product.dart';
import '../../services/category_api.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    Category category;
    Product product;

    on<GetCategory>((event, emit) async {
      try {
        category = await CategoryApi.getCategory();

        emit(CategoryLoaded(
          category: category.data!,
          message: category.message,
        ));
      } catch (e) {
        emit(CategoryError());
      }
    });

    on<SearchCategory>((event, emit) async {
      try {
        product = await CategoryApi.searchCategory(category: event.category);

        emit(CategoryResult(
          product: product.data!,
          message: product.message,
        ));
      } catch (e) {
        emit(CategoryError());
      }
    });
  }
}
