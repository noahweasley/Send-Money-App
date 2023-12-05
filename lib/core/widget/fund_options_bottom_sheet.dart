import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/constants/dimensions.dart';
import 'package:veegil/core/widget/notifiers.dart';
import 'package:veegil/core/widget/util.dart';

class _FundOptionsBottomSheet extends StatelessWidget {
  final String bankName, accountNumber;
  final VoidCallback? onCopyTap;
  final VoidCallback? onOtherOptionsTap;
  final bool? autoClose;

  const _FundOptionsBottomSheet({
    required this.bankName,
    required this.accountNumber,
    this.onCopyTap,
    this.onOtherOptionsTap,
    this.autoClose = false,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColor.background,
      child: Wrap(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(Dimensions.space1),
                child: Container(
                  height: 5,
                  width: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: AppColor.primaryDark,
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.space1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.space2),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Bank Account Details',
                    style: AppStyle.title,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Divider(thickness: 1.0),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Fund your wallet by making a transfer to the bank account below',
                  style: AppStyle.subtitle1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.space2,
                  vertical: Dimensions.space1,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.grey.withOpacity(0.2),
                    borderRadius: WidgetUtil.borderRadiusCircularOnlyTop1,
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        dense: true,
                        title: Text(
                          'Bank Name',
                          style: AppStyle.subtitle2,
                        ),
                        subtitle: Text(
                          bankName,
                          style: AppStyle.subtitle2,
                        ),
                      ),
                      // const Divider(),
                      ListTile(
                        dense: true,
                        title: Text(
                          'Account Number',
                          style: AppStyle.subtitle2.bold,
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              accountNumber,
                              style: AppStyle.subtitle2,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.space1),
                              child: IconButton(
                                iconSize: 16,
                                onPressed: onCopyTap ??
                                    () async {
                                      await Clipboard.setData(ClipboardData(text: accountNumber));
                                      Notifiers.showSnackBar(message: 'Account number copied to clipboard');
                                    },
                                icon: const Icon(
                                  Icons.copy,
                                  color: AppColor.dark,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.space1),
                child: ListTile(
                  horizontalTitleGap: 0,
                  leading: const Icon(
                    Icons.info,
                    color: AppColor.grey,
                  ),
                  title: Text(
                    'Your wallet will be automatically funded once payment is received.',
                    style: AppStyle.body2PrimaryDark,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.space2),
                child: Material(
                  borderRadius: WidgetUtil.borderRadiusRoundedAllSides,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: AppColor.primaryDark.withOpacity(0.2),
                    onTap: () {
                      onOtherOptionsTap != null ? onOtherOptionsTap!() : null;
                      if (autoClose ?? false) {
                        Get.back();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.primaryTint.withOpacity(0.3)),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColor.primaryTint.withOpacity(0.3),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          child: const Icon(
                            Icons.circle,
                            color: AppColor.primaryMain,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_rounded,
                          color: AppColor.dark,
                        ),
                        title: Text(
                          'Fund direct using Veegil Topup',
                          style: AppStyle.subtitle2.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.space2),
            ],
          ),
        ],
      ),
    );
  }
}

class FundOptionsBottomSheet {
  /// show fund options dialog
  static Future<T?> show<T>({
    required String bankName,
    required String accountNumber,
    VoidCallback? onCopyTap,
    VoidCallback? onOtherOptionsTap,
    bool? autoClose,
  }) async {
    return await Get.bottomSheet<T>(
      _FundOptionsBottomSheet(
        bankName: bankName,
        accountNumber: accountNumber,
        onCopyTap: onCopyTap,
        onOtherOptionsTap: onOtherOptionsTap,
        autoClose: autoClose,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: WidgetUtil.borderRadiusCircularOnlyTop1,
      ),
    );
  }
}
