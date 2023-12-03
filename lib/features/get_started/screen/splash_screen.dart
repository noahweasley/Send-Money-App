import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veegil/core/utilities/services.dart';
import 'package:veegil/features/authentication/screen/login.dart';
import 'package:veegil/features/get_started/screen/on_board_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String id = 'splash-screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final store = GetStorage();
  bool? _boarding;

  checkBoarding() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _boarding = prefs.getBool('onBoard');
    });
  }

  @override
  initState() {
    checkBoarding();

    Timer(
        const Duration(
          seconds: 3,
        ), () {
      // check if device is new
      _boarding == null
          ? Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (BuildContext context) => const OnBoardScreen()),
            )
          : Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (BuildContext context) => const LoginScreen()),
            );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Services services = Services();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [services.logo(60, null)],
        ),
      ),
    );
  }
}
