import 'package:flutter/material.dart';
import '../config/style.dart';
import '../widgets/app_layout.dart';

class MedicList extends StatelessWidget {
  const MedicList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: 'Selamat Datang di Alya Farma!',
      body: Column(
        children: const [
          Text('data'),
        ],
      ),
    );
  }
}