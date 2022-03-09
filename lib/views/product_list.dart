import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/style.dart';

import '../models/category.dart';
import '../models/product.dart';

import '../blocs/product/product_bloc.dart';

import '../services/category_api.dart';

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
          child: FutureBuilder(
            future: CategoryApi.getCategory(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.success) {
                  if (snapshot.data.data.isNotEmpty) {
                    return _categoryContent(snapshot.data);
                  } else {
                    return Center(
                      child: Text(
                        'Data kosong!',
                        style: lightText(13),
                      ),
                    );
                  }
                } else {
                  return Center(
                    child: Text(
                      snapshot.data.message,
                      style: lightText(13),
                    ),
                  );
                }
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Something went wrong!',
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
              if (state is ProductLoaded) {
                if (state.product.isNotEmpty) {
                  return _productContent(state);
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
                    'Something went wrong!',
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

  Widget _categoryContent(Category category) {
    final data = category.data;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data!.length,
      itemBuilder: (BuildContext context, int index) {
        return CategoryContent(
          image: data[index].image,
          name: data[index].name,
          onTapArgs: <String, dynamic>{
            'category': data[index].name,
          },
        );
      },
    );
  }

  Widget _productContent(ProductLoaded productLoaded) {
    final List<ProductData> _product = productLoaded.product;

    return GridView.builder(
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
    );
  }
}
