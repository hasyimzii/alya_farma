import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/product.dart';
import '../../services/product_api.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    Product product;

    on<GetProduct>((event, emit) async {
      try {
        product = await ProductApi.getProduct();

        emit(ProductLoaded(
          product: product.data!,
          message: product.message,
        ));
      } catch (e) {
        emit(ProductError());
      }
    });

    on<SearchProduct>((event, emit) async {
      try {
        product = await ProductApi.searchProduct(name: event.name);

        emit(ProductLoaded(
          product: product.data!,
          message: product.message,
        ));
      } catch (e) {
        emit(ProductError());
      }
    });
  }
}
