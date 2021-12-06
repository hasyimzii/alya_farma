import 'package:flutter/material.dart';
import '../widgets/app_layout.dart';
import '../widgets/search_bar.dart';
import '../widgets/grid_content.dart';

class MedicList extends StatelessWidget {
  const MedicList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: SearchBar(
            controller: TextEditingController(),
            label: 'Cari Obat',
            onChanged: (value) {},
          ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 6.0 / 9.0,
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
