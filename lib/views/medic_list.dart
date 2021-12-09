import 'package:flutter/material.dart';
import '../config/style.dart';

import '../widgets/app_layout.dart';
import '../widgets/grid_content.dart';

class MedicList extends StatelessWidget {
  const MedicList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    
    return AppLayout(
      color: blueColor,
      controller: _searchController,
      onChanged: (value) {},
      onClear: () {
        _searchController.clear;
        FocusScope.of(context).unfocus();
      },
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 6.0 / 9.0,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              padding: const EdgeInsets.all(10),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return const GridContent(
                  title: 'Produk A',
                  subtitle: 'Rp 80.000',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
