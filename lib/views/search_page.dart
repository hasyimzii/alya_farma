import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/style.dart';

import '../providers/medic_provider.dart';

import '../widgets/app_layout.dart';
import '../widgets/grid_content.dart';
import '../widgets/search_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    return Consumer<MedicProvider>(
      builder: (
        BuildContext context,
        MedicProvider medic,
        Widget? child,
      ) {
        return AppLayout(
          radius: 20,
          color: blueColor,
          title: SearchBar(
            readOnly: false,
            controller: _searchController,
            onSubmitted: (value) {
              medic.medicSearch(value);
            },
          ),
          body: _searchResult(),
        );
      },
    );
  }

  Widget _searchResult() {
    return Expanded(
      child: Consumer<MedicProvider>(
        builder: (
          BuildContext context,
          MedicProvider medic,
          Widget? child,
        ) {
          if (medic.searchResult.isNotEmpty) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 6.0 / 10.0,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              padding: const EdgeInsets.all(10),
              itemCount: medic.searchLength,
              itemBuilder: (BuildContext context, int index) {
                return GridContent(
                  image: medic.searchResult[index].image,
                  name: medic.searchResult[index].name,
                  category: medic.searchResult[index].category,
                  price: medic.searchResult[index].price,
                  discount: medic.searchResult[index].discount,
                  onTapArgs: <String, dynamic>{
                    'medic': medic.searchResult[index],
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
