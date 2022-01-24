import 'package:flutter/material.dart';
import '../common/style.dart';

import '../widgets/app_layout.dart';
// Kami adalah perusahaan yang bergerak dibidang pengadaan alat kesehatan, pelayanan service & maintenance yang awalnya dimulai dengan penjualan alat-alat kesehatan untuk personal use / homecare.
// Kami terus berkembang dari tahun ke tahun sehingga produk kami meluas dan mencakup alat-alat kedokteran untuk kebutuhan klinik dan rumah sakit.

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      searchBar: false,
      title: Text(
        'Tentang Kami',
        style: titleText(15),
      ),
      body: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 200,
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Kami adalah perusahaan yang bergerak dibidang pengadaan alat '
                  'kesehatan, pelayanan service & maintenance yang awalnya dimulai '
                  'dengan penjualan alat-alat kesehatan untuk personal use / homecare. '
                  'Kami terus berkembang dari tahun ke tahun sehingga produk kami meluas '
                  'dan mencakup alat-alat kedokteran untuk kebutuhan klinik dan rumah sakit.',
                  style: lightText(12),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
