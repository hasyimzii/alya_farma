import 'dart:async';
import 'package:flutter/material.dart';
import '../config/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, '/medic_list'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 210,
            ),
            const SizedBox(height: 40),
            SizedBox(
              child: CircularProgressIndicator(
                color: blueColor,
              ),
              width: 30,
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
