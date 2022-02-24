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
    final TextEditingController _phoneController = TextEditingController();

    return AppLayout(
      searchBar: false,
      title: Text(
        'Ubah Profil',
        style: titleText(15),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Consumer<UserProvider>(
          builder: (
            BuildContext context,
            UserProvider user,
            Widget? child,
          ) {
            _nameController.text = user.user.name;
            _phoneController.text = user.user.phone;

            return Center(
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
                    title: 'No Telpon',
                    controller: _phoneController,
                  ),
                  const SizedBox(height: 15),
                  SubmitButton(
                    text: 'Simpan',
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      user.setUser(
                        _nameController.text,
                        _phoneController.text,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text('Profil berhasil diperbarui!'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
