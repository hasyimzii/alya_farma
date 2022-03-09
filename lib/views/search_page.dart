import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/style.dart';

import '../models/product.dart';
import '../blocs/product/product_bloc.dart';

import '../widgets/app_layout.dart';
import '../widgets/grid_content.dart';
import '../widgets/search_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    return AppLayout(
      searchBar: true,
      title: SearchBar(
        readOnly: false,
        controller: _searchController,
        onSubmitted: (value) {
          final ProductBloc _productBLoc = context.read<ProductBloc>();
          _productBLoc.add(SearchProduct(name: value));
        },
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoaded) {
            if (state.product.isNotEmpty) {
              return _searchContent(state);
            } else {
              return Center(
                child: Text(
                  'Data tidak ditemukan!',
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
    );
  }

  Widget _searchContent(ProductLoaded productLoaded) {
    final List<ProductData> _product = productLoaded.product;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 6.0 / 10.0,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      padding: const EdgeInsets.fromLTRB(10, 90, 10, 10),
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
