import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/style.dart';

import '../providers/user_provider.dart';

import '../widgets/app_layout.dart';
import '../widgets/form_input.dart';
import '../widgets/submit_button.dart';

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