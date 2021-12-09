import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../config/style.dart';

import '../widgets/app_layout.dart';
import '../widgets/search_bar.dart';

class MedicDetail extends StatelessWidget {
  const MedicDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    return AppLayout(
      color: Colors.transparent,
      controller: _searchController,
      onChanged: (value) {},
      onClear: () {
        _searchController.clear;
        FocusScope.of(context).unfocus();
      },
      body: SlidingUpPanel(
        body: Positioned(
          top: -100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/product.png',
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        panel: Center(
          child: Text('data'),
        ),
      ),
    );
  }
}
