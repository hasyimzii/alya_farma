import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/style.dart';

import '../models/product.dart';
import '../blocs/category/category_bloc.dart';

import '../widgets/app_layout.dart';
import '../widgets/grid_content.dart';
import '../widgets/search_bar.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // define arguments
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    String category = args['category'];

    return AppLayout(
      searchBar: true,
      title: SearchBar(
        readOnly: true,
        controller: TextEditingController(),
        onSubmitted: (value) {},
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (BuildContext context, CategoryState state) {
          if (state is! CategoryLoaded) {
            final CategoryBloc _categoryBloc = context.read<CategoryBloc>();
            _categoryBloc.add(SearchCategory(category: category));
          }

          if (state is CategoryResult) {
            if (state.product.isNotEmpty) {
              return _categoryContent(state);
            } else {
              return Center(
                child: Text(
                  'Data tidak ditemukan!',
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
    );
  }

  Widget _categoryContent(CategoryResult categoryResult) {
    final List<ProductData> _product = categoryResult.product;

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
