import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:send_money_app/core/constants/app_style.dart';
import 'package:send_money_app/core/constants/colors.dart';
import 'package:send_money_app/core/constants/dimensions.dart';
import 'package:send_money_app/core/utilities/size_config.dart';
import 'package:send_money_app/core/validators/validators.dart';
import 'package:send_money_app/core/widgets/app_bar.dart';
import 'package:send_money_app/core/widgets/app_button.dart';
import 'package:send_money_app/core/widgets/app_icon.dart';
import 'package:send_money_app/core/widgets/app_textfield.dart';
import 'package:send_money_app/core/widgets/overlay_indeterminate_progress.dart';
import 'package:send_money_app/features/withdraw/controllers/withdraw_controller.dart';

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
                          'Instant Withdrawals from send_money_app Bank',
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
                              controller.walletBalance,
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
