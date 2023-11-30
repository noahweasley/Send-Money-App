import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veebank/auth/login.dart';
import 'package:veebank/auth/reset_password.dart';
import 'package:veebank/auth/sign_up.dart';
import 'package:veebank/core/app_init.dart';
import 'package:veebank/pages/home_page.dart';
import 'package:veebank/pages/transactions.dart';
import 'package:veebank/provider/account_provider.dart';
import 'package:veebank/screens/main_page.dart';
import 'package:veebank/screens/splash_screen.dart';
import 'package:veebank/services/api_services/shared_services.dart';

Widget _defaultHome = const LoginScreen();
void main() async {
  await AppInitialization.setup();
  bool result = SharedService.isLoggedIn();
  if (result) {
    _defaultHome = const MainScreen(
      index: 0,
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AccountProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VeeBank: Your cash anywhere you go',
        theme: ThemeData(
          fontFamily: "OpenSans",
          primarySwatch: Colors.deepOrange,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        // routes: Routes.route(),
        routes: {
          '/': (context) => _defaultHome,
          SplashScreen.id: (BuildContext context) => const SplashScreen(),
          LoginScreen.id: (BuildContext context) => const LoginScreen(),
          Signup.id: (BuildContext context) => const Signup(),
          MainScreen.id: (BuildContext context) => const MainScreen(),
          HomePage.id: (BuildContext context) => const HomePage(),
          Transactions.id: (BuildContext context) => const Transactions(),
          ResetPassword.id: (BuildContext context) => const ResetPassword(),
        },
        initialRoute: SplashScreen.id,
      ),
    );
  }
}
