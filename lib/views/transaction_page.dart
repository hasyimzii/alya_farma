import 'package:flutter/material.dart';
import '../common/style.dart';

import '../widgets/app_layout.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      searchBar: false,
      title: Text(
        'Buat Transaksi',
        style: titleText(15),
      ),
      body: Text(''),
    );
  }
}