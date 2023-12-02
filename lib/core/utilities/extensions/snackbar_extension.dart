import 'package:flutter/material.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/colors.dart';

enum SnackbarType { info, warning, success }

extension SnackbarExtension on BuildContext {
  void showSnackbar({
    VoidCallback? onTap,
    String? message,
    String? actionButtonLabel,
    SnackbarType type = SnackbarType.info,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          backgroundColor: type == SnackbarType.success
              ? AppColor.green
              : type == SnackbarType.warning
                  ? AppColor.red
                  : AppColor.blueDark,
          content: Text(
            message ?? '',
            style: AppStyle.body1.copyWith(color: AppColor.white),
          ),
          duration: const Duration(milliseconds: 3000),
          action: onTap == null
              ? null
              : SnackBarAction(
                  label: actionButtonLabel ?? '',
                  textColor: type == SnackbarType.success
                      ? AppColor.blueDark
                      : type == SnackbarType.warning
                          ? AppColor.secondaryTint
                          : AppColor.secondaryDark,
                  onPressed: onTap,
                ),
        ),
      );
    });
  }
}
