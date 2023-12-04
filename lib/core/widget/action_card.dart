import 'package:flutter/material.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/constants/dimensions.dart';
import 'package:veegil/core/widget/util.dart';

class ActionCard extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  final IconData iconData;
  final String title;
  final String subtitle;

  const ActionCard({
    super.key,
    required this.onTap,
    required this.color,
    required this.iconData,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.space1),
      child: InkWell(
        borderRadius: WidgetUtil.borderRadiusRoundedAllSides,
        onTap: onTap,
        child: Ink(
          width: double.infinity,
          decoration: BoxDecoration(
            color: color.withAlpha(0x08),
            borderRadius: WidgetUtil.borderRadiusRoundedAllSides,
            border: Border.all(color: color, width: 0.1),
          ),
          padding: const EdgeInsets.all(Dimensions.space1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Ink(
                    decoration: BoxDecoration(
                      color: AppColor.background,
                      borderRadius: BorderRadius.circular(2000),
                    ),
                    child: Icon(
                      iconData,
                      size: Dimensions.iconSize,
                      color: color,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.space2),
              Text(
                title,
                style: AppStyle.title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
