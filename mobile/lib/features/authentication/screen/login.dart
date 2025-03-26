import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:send_money_app/core/constants/app_style.dart';
import 'package:send_money_app/core/constants/colors.dart';
import 'package:send_money_app/core/constants/dimensions.dart';
import 'package:send_money_app/core/navigation/app_routes.dart';
import 'package:send_money_app/core/utilities/size_config.dart';
import 'package:send_money_app/core/validators/password_validator.dart';
import 'package:send_money_app/core/validators/phone_number_validator.dart';
import 'package:send_money_app/core/widgets/app_bar.dart';
import 'package:send_money_app/core/widgets/app_button.dart';
import 'package:send_money_app/core/widgets/app_checkbox.dart';
import 'package:send_money_app/core/widgets/app_icon.dart';
import 'package:send_money_app/core/widgets/app_textfield.dart';
import 'package:send_money_app/core/widgets/overlay_indeterminate_progress.dart';
import 'package:send_money_app/features/authentication/controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: CustomAppBar(
          title: Text(
            'Log in',
            style: AppStyle.title,
          ),
        ),
        body: Obx(() {
          return OverlayIndeterminateProgress(
            isLoading: controller.isLoading,
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
                          'Login using your send_money_app Account',
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
                                title: 'Phone number',
                                hintText: 'Enter phone number',
                                validator: PhoneNumberValidator.validate,
                              ),
                              const SizedBox(height: Dimensions.minSpace),
                              AppTextField(
                                controller: controller.passwordTextController,
                                title: 'Password',
                                hintText: 'Enter password',
                                validator: PasswordValidator.validate,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: Dimensions.space1),
                        Row(
                          children: [
                            Obx(() {
                              return AppCheckBox(
                                checked: controller.isRememberMe,
                                text: 'Remember me',
                                onChanged: (state) {
                                  controller.isRememberMe = state;
                                },
                              );
                            }),
                          ],
                        ),
                        const SizedBox(height: Dimensions.space1),
                        Obx(() {
                          return AppButton(
                            showLoader: controller.isLoading,
                            text: 'Login',
                            onTap: controller.login,
                          );
                        }),
                        const SizedBox(height: Dimensions.space2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: AppStyle.body1,
                            ),
                            const SizedBox(width: Dimensions.minSpace),
                            InkWell(
                              borderRadius: BorderRadius.circular(Dimensions.borderRadius1),
                              onTap: () => Get.offNamed(Routes.signUp),
                              child: Padding(
                                padding: const EdgeInsets.all(Dimensions.space1),
                                child: Text(
                                  'Create an account',
                                  style: AppStyle.body1SecondaryDark,
                                ),
                              ),
                            ),
                          ],
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
