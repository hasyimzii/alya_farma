import 'package:alya_farma/models/product.dart';
import 'package:flutter/material.dart';
import '../common/style.dart';

import '../models/product.dart';

import '../network/category_api.dart';

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
      body: FutureBuilder(
        future: CategoryApi.searchCategory(category: category),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.success) {
              return _categoryContent(snapshot.data);
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
    );
  }

  Widget _categoryContent(Product product) {
    final data = product.data;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 6.0 / 10.0,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      padding: const EdgeInsets.all(10),
      itemCount: data!.length,
      itemBuilder: (BuildContext context, int index) {
        return GridContent(
          image: data[index].image,
          name: data[index].name,
          category: data[index].category,
          price: int.parse(data[index].price),
          discount: int.parse(data[index].discount),
          onTapArgs: <String, dynamic>{
            'product': data[index],
          },
        );
      },
    );
  }
}
