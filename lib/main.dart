import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/splash_screen.dart';
import 'views/medic_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      initialRoute: '/splash_screen',
      routes: {
        '/splash_screen': (context) => const SplashScreen(),
        '/medic_list': (context) => const MedicList(),
      },
    );
  }
}
