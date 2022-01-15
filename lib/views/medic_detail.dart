import 'package:flutter/material.dart';
import '../common/style.dart';

import '../models/medic.dart';

import '../widgets/app_layout.dart';
import '../widgets/detail_content.dart';

class MedicDetail extends StatelessWidget {
  const MedicDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // define arguments
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    Medic? medic = args['medic'];

    return AppLayout(
      radius: 0,
      color: blueColor,
      title: Text(
        'Detail Produk',
        style: whiteText(15),
      ),
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
