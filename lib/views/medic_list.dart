import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/style.dart';

import '../providers/category_provider.dart';
import '../providers/medic_provider.dart';

import '../widgets/app_layout.dart';
import '../widgets/category_content.dart';
import '../widgets/grid_content.dart';
import '../widgets/search_bar.dart';

class MedicList extends StatelessWidget {
  const MedicList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      radius: 20,
      color: blueColor,
      title: SearchBar(
        readOnly: true,
        controller: TextEditingController(),
        onSubmitted: (value) {},
      ),
      body: Column(
        children: [
          SizedBox(
            height: 75,
            child: Consumer<CategoryProvider>(
              builder: (
                BuildContext context,
                CategoryProvider category,
                Widget? child,
              ) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryContent(
                      image: category.category[index].image,
                      name: category.category[index].name,
                      onTap: () {
                        category.medicCategory(category.category[index].name);
                        Navigator.pushNamed(
                          context,
                          '/category_page',
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          Expanded(
            child: Consumer<MedicProvider>(
              builder: (
                BuildContext context,
                MedicProvider medic,
                Widget? child,
              ) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 6.0 / 10.0,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  padding: const EdgeInsets.all(10),
                  itemCount: medic.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GridContent(
                      image: medic.medic[index].image,
                      name: medic.medic[index].name,
                      category: medic.medic[index].category,
                      price: medic.medic[index].price,
                      discount: medic.medic[index].discount,
                      onTapArgs: <String, dynamic>{
                        'medic': medic.medic[index],
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
