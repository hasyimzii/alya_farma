import 'package:flutter/material.dart';

import '../models/medic_model.dart';

import '../widgets/app_layout.dart';
import '../widgets/detail_content.dart';

class MedicDetail extends StatelessWidget {
  const MedicDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // define arguments
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    MedicModel? medic = args['medic'];

    return AppLayout(
      radius: 0,
      readOnly: true,
      controller: TextEditingController(),
      onSubmitted: (value) {},
      onClear: () {},
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
