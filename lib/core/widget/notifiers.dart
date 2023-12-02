import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/constants/dimensions.dart';
import 'package:veegil/core/utilities/extensions/widget_extension.dart';
import 'package:veegil/core/widget/util.dart';

/// Dialog types
enum NotificationType { info, warning, success }

class _Dialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final NotificationType? dialogType;
  final List<DialogButton>? buttons;

  const _Dialog({
    required this.title,
    required this.subtitle,
    this.dialogType,
    this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = dialogType == NotificationType.warning
        ? AppStyle.titleError
        : (dialogType == NotificationType.success ? AppStyle.titleGreen : AppStyle.titlePrimaryDark);

    return Dialog(
      backgroundColor: AppColor.background,
      shape: RoundedRectangleBorder(
        borderRadius: WidgetUtil.borderRadiusRoundedAllSides3,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Wrap(
        children: [
          Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: titleStyle,
              ).paddingTop(Dimensions.space2),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: AppStyle.body2PrimaryDark,
              ).paddingOnly(
                bottom: Dimensions.space2,
                top: Dimensions.space1,
              ),
              Visibility(
                visible: buttons?.isNotEmpty ?? false,
                child: const Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColor.separatorColor,
                ),
              ),
              Visibility(
                visible: buttons?.isNotEmpty ?? false,
                child: Row(
                  children: buttons?.isEmpty ?? true
                      ? []
                      : buttons!.map((dialogButton) {
                          return TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: dialogButton.labelColor.withOpacity(0.1),
                            ),
                            onPressed: dialogButton.onTap,
                            child: Text(
                              dialogButton.label,
                              style: AppStyle.button.apply(color: dialogButton.labelColor),
                            ).paddingAll(Dimensions.space2),
                          ).expand();
                        }).toList(),
                ),
              ),
            ],
          ).center(),
        ],
      ),
    );
  }
}

class DialogButton {
  final String label;
  final VoidCallback? onTap;
  final Color labelColor;

  DialogButton({
    required this.label,
    this.onTap,
    this.labelColor = AppColor.primaryMain,
  });
}

class Notifiers {
  /// show custom pop-up dialog
  static Future<T?> showAppDialog<T>({
    NotificationType? type,
    bool barrierDismissible = false,
    required String title,
    required String subtitle,
    List<DialogButton>? buttons,
  }) async {
    return Get.dialog(
      _Dialog(
        dialogType: type,
        buttons: buttons,
        title: title,
        subtitle: subtitle,
      ),
    );
  }

  static SnackbarController showSnackBar({
    required String message,
    NotificationType? type = NotificationType.info,
  }) {
    final color = type == NotificationType.warning
        ? AppColor.red
        : (type == NotificationType.success ? AppColor.green : AppColor.primaryDark);

    return Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(seconds: 3),
        messageText: Text(
          message,
          style: AppStyle.titleWhite,
        ),
        backgroundColor: color,
      ),
    );
  }
}
