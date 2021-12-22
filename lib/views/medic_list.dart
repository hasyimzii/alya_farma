import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/medic_provider.dart';

import '../widgets/app_layout.dart';
import '../widgets/grid_content.dart';

class MedicList extends StatelessWidget {
  const MedicList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    return AppLayout(
      radius: 20,
      controller: _searchController,
      onChanged: (value) {},
      onClear: () {
        _searchController.clear;
        FocusScope.of(context).unfocus();
      },
      body: Column(
        children: [
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
                      onTapArgs:  medic.medic[index],
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
