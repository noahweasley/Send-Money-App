import 'package:flutter/material.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/constants/dimensions.dart';
import 'package:veegil/core/utilities/extensions/widget_extension.dart';
import 'package:veegil/core/widget/util.dart';

/// Dialog types
enum DialogType { info, warning, message }

class _Dialog extends StatelessWidget {
  final BuildContext context;
  final String title;
  final String subtitle;
  final DialogType? dialogType;
  final List<DialogButton>? buttons;

  const _Dialog(
    this.context, {
    required this.title,
    required this.subtitle,
    this.dialogType,
    this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    var titleStyle = dialogType == DialogType.warning
        ? AppStyle.titleError
        : (dialogType == DialogType.message ? AppStyle.titleGreen : AppStyle.titlePrimaryDark);

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

/// show custom pop-up dialog
Future<T?> showAppDialog<T>(
  BuildContext context, {
  DialogType? dialogType,
  bool barrierDismissible = false,
  required String title,
  required String subtitle,
  List<DialogButton>? buttons,
}) async {
  return await showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierColor: Colors.black.withOpacity(0.3),
    builder: (context) => _Dialog(
      context,
      title: title,
      subtitle: subtitle,
      buttons: buttons,
      dialogType: dialogType,
    ),
  );
}
