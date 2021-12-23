import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/medic_model.dart';
import '../providers/medic_provider.dart';


import '../widgets/app_layout.dart';
import '../widgets/detail_content.dart';

class MedicDetail extends StatelessWidget {
  const MedicDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    // define arguments
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    MedicModel? medic = args['medic'];

    return AppLayout(
      radius: 0,
      controller: _searchController,
      onChanged: (value) {},
      onClear: () {
        _searchController.clear;
        FocusScope.of(context).unfocus();
      },
      body: DetailContent(
        code: medic!.code,
        name: medic.name,
        category: medic.category,
        unit: medic.unit,
        stock: medic.stock,
        price: medic.price,
        discount: medic.discount,
        image: medic.image,
        description: medic.description,
      ),
    );
  }
}
