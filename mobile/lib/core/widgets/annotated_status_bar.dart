import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:veegil/core/constants/colors.dart';

class AnnotatedStatusBar extends StatelessWidget {
  final Widget child;

  const AnnotatedStatusBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColor.systemOverlayColor,
        statusBarBrightness: Brightness.light, // For iOS
        statusBarIconBrightness: Brightness.light, // For Android
        systemNavigationBarColor: AppColor.systemOverlayColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: child,
    );
  }
}
