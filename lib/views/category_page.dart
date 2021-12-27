import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/style.dart';

import '../providers/category_provider.dart';

import '../widgets/app_layout.dart';
import '../widgets/grid_content.dart';
import '../widgets/search_bar.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (
        BuildContext context,
        CategoryProvider medic,
        Widget? child,
      ) {
        return AppLayout(
          radius: 20,
          title: SearchBar(
            readOnly: true,
            controller: TextEditingController(),
            onSubmitted: (value) {},
          ),
          body: _categoryResult(),
        );
      },
    );
  }

  Widget _categoryResult() {
    return Expanded(
      child: Consumer<CategoryProvider>(
        builder: (
          BuildContext context,
          CategoryProvider medic,
          Widget? child,
        ) {
          if (medic.categoryResult.isNotEmpty) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 6.0 / 10.0,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              padding: const EdgeInsets.all(10),
              itemCount: medic.categoryLength,
              itemBuilder: (BuildContext context, int index) {
                return GridContent(
                  image: medic.categoryResult[index].image,
                  name: medic.categoryResult[index].name,
                  category: medic.categoryResult[index].category,
                  price: medic.categoryResult[index].price,
                  discount: medic.categoryResult[index].discount,
                  onTapArgs: <String, dynamic>{
                    'medic': medic.categoryResult[index],
                  },
                );
              },
            );
          } else {
            return Center(
              child: Text(
                'Data Tidak Ada!',
                style: subtitleTextStyle,
              ),
            );
          }
        },
      ),
    );
  }
}
