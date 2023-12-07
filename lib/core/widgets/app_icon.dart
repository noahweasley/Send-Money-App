import 'package:flutter/material.dart';
import 'package:veegil/core/constants/assets.dart';

class AppLogo extends StatelessWidget {
  final double? width;
  final double? height;

  const AppLogo({
    super.key,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.appIcon,
      width: width ?? 80,
      height: height ?? 80,
    );
  }
}
