import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/constants/dimensions.dart';
import 'package:veegil/core/utilities/size_config.dart';
import 'package:veegil/core/validators/validators.dart';
import 'package:veegil/core/widget/app_bar.dart';
import 'package:veegil/core/widget/app_button.dart';
import 'package:veegil/core/widget/app_icon.dart';
import 'package:veegil/core/widget/app_textfield.dart';
import 'package:veegil/core/widget/overlay_indeterminate_progress.dart';
import 'package:veegil/features/withdraw/controllers/withdraw_controller.dart';

class WithdrawScreen extends GetView<WithdrawController> {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: CustomAppBar(
          title: Text(
            'Withdraw',
            style: AppStyle.title,
          ),
          onNavigateUp: controller.giveResults,
        ),
        body: Obx(() {
          return OverlayIndeterminateProgress(
            isLoading: controller.isProcessing,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Divider(
                    thickness: 1,
                    color: AppColor.primaryTint,
                  ),
                  const SizedBox(height: Dimensions.space1),
                  Padding(
                    padding: const EdgeInsets.all(Dimensions.space2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: Dimensions.space3),
                          child: AppLogo(),
                        ),
                        Text(
                          'Instant Withdrawals from Veegil Bank',
                          textAlign: TextAlign.center,
                          style: AppStyle.headline5PrimaryDark,
                        ),
                        const SizedBox(height: Dimensions.space6),
                        Form(
                          key: controller.formKey,
                          child: AppTextField(
                            controller: controller.amountController,
                            title: 'Enter amount',
                            hintText: 'Type amount here',
                            validator: EmptyStringValidator.validate,
                            inputFormatters: const [],
                          ),
                        ),
                        const SizedBox(height: Dimensions.minSpace),
                        Padding(
                          padding: const EdgeInsets.only(left: Dimensions.space1),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              controller.balance,
                              style: AppStyle.subtitle2.apply(color: AppColor.primaryTint),
                            ),
                          ),
                        ),
                        const SizedBox(height: Dimensions.space2),
                        AppButton(
                          text: 'Withdraw',
                          onTap: controller.withdraw,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
