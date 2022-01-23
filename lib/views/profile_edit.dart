import 'package:flutter/material.dart';
import '../common/style.dart';

import '../widgets/app_layout.dart';
import '../widgets/form_input.dart';
import '../widgets/submit_button.dart';

// Kami adalah perusahaan yang bergerak dibidang pengadaan alat kesehatan, pelayanan service & maintenance yang awalnya dimulai dengan penjualan alat-alat kesehatan untuk personal use / homecare.
// Kami terus berkembang dari tahun ke tahun sehingga produk kami meluas dan mencakup alat-alat kedokteran untuk kebutuhan klinik dan rumah sakit.

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();

    return AppLayout(
      searchBar: false,
      title: Text(
        'Ubah Profil',
        style: titleText(15),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  'Ubah Profil',
                  style: titleText(25),
                ),
                subtitle: Text(
                  'Perbarui profil sesuai data diri kamu.',
                  style: subtitleText(13),
                ),
              ),
              const SizedBox(height: 15),
              FormInput(
                obscureText: false,
                title: 'Nama',
                controller: _nameController,
              ),
              const SizedBox(height: 15),
              FormInput(
                obscureText: false,
                title: 'Email',
                controller: _emailController,
              ),
              const SizedBox(height: 15),
              FormInput(
                obscureText: false,
                title: 'No Telpon',
                controller: _phoneController,
              ),
              const SizedBox(height: 15),
              SubmitButton(
                text: 'Simpan',
                onTap: () {} ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
