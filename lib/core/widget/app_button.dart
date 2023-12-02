import 'package:flutter/material.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/constants/dimensions.dart';
import 'package:veegil/core/utilities/extensions/size_extensions.dart';
import 'package:veegil/core/utilities/extensions/widget_extension.dart';

class AppButton extends StatelessWidget {
  final void Function()? onTap;
  final double? height;
  final double? width;
  final String text;
  final Color buttonColor;
  final Color textColor;
  final bool hasBorder;
  final Color borderColor;
  final double? fontSize;
  final Widget? child;
  final Widget? icon;
  final bool showLoader;
  final bool enabled;

  const AppButton({
    super.key,
    required this.text,
    this.onTap,
    this.icon,
    this.height,
    this.width,
    this.child,
    this.borderColor = AppColor.primaryDark,
    this.buttonColor = AppColor.primaryDark,
    this.textColor = AppColor.white,
    this.enabled = true,
    this.fontSize = 17,
    this.hasBorder = false,
    this.showLoader = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: height ?? 47.sp,
      child: Material(
        color: buttonColor,
        shape: RoundedRectangleBorder(
          side: hasBorder ? BorderSide(color: borderColor) : BorderSide.none,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(0),
            topLeft: Radius.circular(Dimensions.borderRadius3),
            bottomLeft: Radius.circular(Dimensions.borderRadius3),
            bottomRight: Radius.circular(Dimensions.borderRadius3),
          ),
        ),
        child: InkWell(
          onTap: enabled ? (showLoader ? null : onTap) : null,
          customBorder: RoundedRectangleBorder(
            side: hasBorder ? BorderSide(color: borderColor) : BorderSide.none,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(0),
              topLeft: Radius.circular(Dimensions.borderRadius3),
              bottomLeft: Radius.circular(Dimensions.borderRadius3),
              bottomRight: Radius.circular(Dimensions.borderRadius3),
            ),
          ),
          child: Center(
            child: showLoader
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(AppColor.background),
                  ).withSize(
                    width: 20.sp,
                    height: 20.sp,
                  )
                : Text(
                    text,
                    textAlign: TextAlign.center,
                    style: AppStyle.button.copyWith(
                      color: textColor,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
