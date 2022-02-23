import 'package:flutter/material.dart';
import '../common/style.dart';

import '../models/category.dart';
import '../models/product.dart';

import '../network/category_api.dart';
import '../network/product_api.dart';

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
                  return _categoryContent(snapshot.data);
                } else {
                  return Center(
                    child: Text(
                      '${snapshot.data.message}',
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
          child: FutureBuilder(
            future: ProductApi.getProduct(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.success) {
                  return _productContent(snapshot.data);
                } else {
                  return Center(
                    child: Text(
                      '${snapshot.data.message}',
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
      ],
    );
  }

  Widget _categoryContent(Category category) {
    final data = category.data;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
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

  Widget _productContent(Product product) {
    final data = product.data;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 6.0 / 10.0,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      padding: const EdgeInsets.all(10),
      itemCount: data.length,
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
