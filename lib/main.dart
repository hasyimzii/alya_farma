import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'providers/medic_provider.dart';

import 'views/medic_list.dart';
import 'views/medic_detail.dart';
import 'views/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => MedicProvider(),
        ),
      ],
      builder: (
        BuildContext context,
        Widget? child,
      ) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
          initialRoute: '/medic_list',
          routes: {
            '/medic_list': (context) => const MedicList(),
            '/medic_detail': (context) => const MedicDetail(),
            '/search_page': (context) => const SearchPage(),
          },
        );
      },
    );
  }
}
