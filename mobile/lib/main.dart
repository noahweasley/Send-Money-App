import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:send_money_app/core/app_init.dart';
import 'package:send_money_app/core/navigation/app_router.dart';
import 'package:send_money_app/features/shared/bindings/main_binding.dart';

void main() async {
  await AppInitialization.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MainBinding(),
      initialRoute: AppRouter.initialRoute,
      getPages: AppRouter.pages,
      title: 'Send Money App',
    );
  }
}