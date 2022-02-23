import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/style.dart';

import '../models/category.dart';
import '../network/category_api.dart';

import '../providers/category_provider.dart';
import '../providers/medic_provider.dart';

import '../widgets/category_content.dart';
import '../widgets/grid_content.dart';

class MedicList extends StatelessWidget {
  const MedicList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 75,
          child: Consumer<CategoryProvider>(
            builder: (
              BuildContext context,
              CategoryProvider category,
              Widget? child,
            ) {
              return FutureBuilder(
                future: CategoryApi.getCategory(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return _categoryContent(snapshot.data, category);
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
              );
            },
          ),
        ),
        // Expanded(
        //   child: Consumer<MedicProvider>(
        //     builder: (
        //       BuildContext context,
        //       MedicProvider medic,
        //       Widget? child,
        //     ) {
        //       return GridView.builder(
        //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 2,
        //           childAspectRatio: 6.0 / 10.0,
        //           mainAxisSpacing: 8,
        //           crossAxisSpacing: 8,
        //         ),
        //         padding: const EdgeInsets.all(10),
        //         itemCount: medic.length,
        //         itemBuilder: (BuildContext context, int index) {
        //           return GridContent(
        //             image: medic.medic[index].image,
        //             name: medic.medic[index].name,
        //             category: medic.medic[index].category,
        //             price: medic.medic[index].price,
        //             discount: medic.medic[index].discount,
        //             onTapArgs: <String, dynamic>{
        //               'medic': medic.medic[index],
        //             },
        //           );
        //         },
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }

  Widget _categoryContent(Category category, CategoryProvider provider) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: category.data.length,
      itemBuilder: (BuildContext context, int index) {
        final data = category.data[index];
        return CategoryContent(
          image: data.image,
          name: data.name,
          onTap: () {
            provider.medicCategory(data.name);
            Navigator.pushNamed(
              context,
              '/category_page',
            );
          },
        );
      },
    );
  }
}
