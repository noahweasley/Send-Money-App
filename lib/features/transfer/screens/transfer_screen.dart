import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/constants/dimensions.dart';
import 'package:veegil/core/utilities/size_config.dart';
import 'package:veegil/core/validators/validators.dart';
import 'package:veegil/core/widgets/app_bar.dart';
import 'package:veegil/core/widgets/app_button.dart';
import 'package:veegil/core/widgets/app_icon.dart';
import 'package:veegil/core/widgets/app_textfield.dart';
import 'package:veegil/core/widgets/overlay_indeterminate_progress.dart';
import 'package:veegil/features/transfer/controllers/transfer_controller.dart';

class TransferScreen extends GetView<TransferController> {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          controller.giveResults();
          return true;
        },
        child: Scaffold(
          backgroundColor: AppColor.background,
          appBar: CustomAppBar(
            title: Text(
              'Transfer',
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
                            'Effortless Cash Transfers with Veegil, try it!',
                            textAlign: TextAlign.center,
                            style: AppStyle.headline5PrimaryDark,
                          ),
                          const SizedBox(height: Dimensions.space6),
                          Form(
                            key: controller.formKey,
                            child: Column(
                              children: [
                                AppTextField(
                                  controller: controller.phoneNumberTextController,
                                  title: 'Account Number',
                                  hintText: 'Enter Account number / Phone number',
                                  validator: PhoneNumberValidator.validate,
                                ),
                                const SizedBox(height: Dimensions.minSpace),
                                AppTextField(
                                  controller: controller.amountController,
                                  title: 'Amount',
                                  hintText: 'Enter amount',
                                  validator: EmptyStringValidator.validate,
                                ),
                              ],
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
                            text: 'Send',
                            onTap: controller.transfer,
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
      ),
    );
  }
}
