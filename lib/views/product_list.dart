import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/style.dart';

import '../models/category.dart';
import '../models/product.dart';

import '../blocs/product/product_bloc.dart';
import '../blocs/category/category_bloc.dart';

import '../widgets/category_content.dart';
import '../widgets/grid_content.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 75,
          child: BlocBuilder<CategoryBloc, CategoryState>(
            builder: (BuildContext context, CategoryState state) {
              if (state is! CategoryLoaded) {
                final CategoryBloc _categoryBloc = context.read<CategoryBloc>();
                _categoryBloc.add(GetCategory());
              }

              if (state is CategoryLoaded) {
                if (state.category.isNotEmpty) {
                  return _categoryContent(state);
                } else {
                  return Center(
                    child: Text(
                      'Data kosong!',
                      style: lightText(13),
                    ),
                  );
                }
              } else if (state is CategoryError) {
                return Center(
                  child: Text(
                    'Terjadi kesalahan!',
                    style: lightText(13),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            },
          ),
        ),
        Expanded(
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (BuildContext context, ProductState state) {
              if (state is! ProductLoaded) {
                final ProductBloc _productBloc = context.read<ProductBloc>();
                _productBloc.add(GetProduct());
              }

              if (state is ProductLoaded) {
                if (state.product.isNotEmpty) {
                  return _productContent(context, state);
                } else {
                  return Center(
                    child: Text(
                      'Data kosong!',
                      style: lightText(13),
                    ),
                  );
                }
              } else if (state is ProductError) {
                return Center(
                  child: Text(
                    'Terjadi kesalahan!',
                    style: lightText(13),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _categoryContent(CategoryLoaded categoryLoaded) {
    final List<CategoryData> _category = categoryLoaded.category;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _category.length,
      itemBuilder: (BuildContext context, int index) {
        return CategoryContent(
          image: _category[index].image,
          name: _category[index].name,
          onTapArgs: <String, dynamic>{
            'category': _category[index].name,
          },
        );
      },
    );
  }

  Widget _productContent(BuildContext context, ProductLoaded productLoaded) {
    final List<ProductData> _product = productLoaded.product;

    return RefreshIndicator(
      onRefresh: () async {
        context.read<CategoryBloc>().add(GetCategory());
        context.read<ProductBloc>().add(GetProduct());
      },
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 6.0 / 10.0,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        padding: const EdgeInsets.all(10),
        itemCount: _product.length,
        itemBuilder: (BuildContext context, int index) {
          return GridContent(
            image: _product[index].image,
            name: _product[index].name,
            category: _product[index].category,
            price: int.parse(_product[index].price),
            discount: int.parse(_product[index].discount),
            onTapArgs: <String, dynamic>{
              'product': _product[index],
            },
          );
        },
      ),
    );
  }
}
