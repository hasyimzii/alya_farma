import 'package:flutter/material.dart';
import '../config/style.dart';
import '../widgets/app_layout.dart';
import '../widgets/grid_content.dart';

class MedicList extends StatelessWidget {
  const MedicList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: '',
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 6.0 / 9.0,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(10),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return const GridContent(
                  title: 'Produkk',
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
