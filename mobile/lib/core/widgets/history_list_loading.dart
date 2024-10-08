import 'package:flutter/material.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/colors.dart';

class HistoryListLoading extends StatelessWidget {
  const HistoryListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: AppColor.white2,
        border: AppStyle.borderPrimaryDark,
        borderRadius: AppStyle.borderRadiusRoundedAllSides,
      ),
    );
  }
}
