import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veebank/auth/login.dart';
import 'package:veebank/screens/on_board_screen.dart';
import 'package:veebank/utilities/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id = "splash-screen";

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
    Services services = Services();

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
