import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:veegil/core/navigation/app_router.dart';
import 'package:veegil/features/shared/bindings/main_binding.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MainBinding(),
      initialRoute: AppRouter.getInitialRoute(),
      getPages: AppRouter.pages,
      title: 'Veegil',
    );
  }
}
