import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/constants/dimensions.dart';
import 'package:veegil/core/navigation/app_routes.dart';
import 'package:veegil/core/utilities/size_config.dart';
import 'package:veegil/core/validators/validators.dart';
import 'package:veegil/core/widget/app_bar.dart';
import 'package:veegil/core/widget/app_button.dart';
import 'package:veegil/core/widget/app_icon.dart';
import 'package:veegil/core/widget/app_textfield.dart';
import 'package:veegil/core/widget/password_strength_bar.dart';
import 'package:veegil/features/auth/controllers/signup_controller.dart';

class SignupScreen extends GetView<SignupController> {
  // TODO: Remove this id
  static const String id = 'sign_up-screen';

  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: CustomAppBar(
          title: Text(
            'Sign up',
            style: AppStyle.title,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Divider(
                thickness: 1,
                color: AppColor.primaryTint,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: Dimensions.space1),
                    Padding(
                      padding: const EdgeInsets.all(Dimensions.space2),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: Dimensions.space3),
                              child: AppLogo(),
                            ),
                            Text(
                              'Create your Veegil Account',
                              textAlign: TextAlign.center,
                              style: AppStyle.headline5PrimaryDark,
                            ),
                            const SizedBox(height: Dimensions.space6),
                            Form(
                              key: controller.formKey,
                              child: Column(
                                children: [
                                  AppTextField(
                                    title: 'Phone number',
                                    hintText: 'Enter phone number',
                                    controller: controller.phoneNumberController,
                                    validator: PhoneNumberValidator.validate,
                                  ),
                                  const SizedBox(height: Dimensions.minSpace),
                                  _buildRegistrationForm(),
                                ],
                              ),
                            ),
                            const SizedBox(height: Dimensions.space1),
                            AppButton(
                              text: 'Sign up',
                              onTap: controller.signup,
                            ),
                            const SizedBox(height: Dimensions.space2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account?',
                                  style: AppStyle.body1,
                                ),
                                const SizedBox(width: Dimensions.minSpace),
                                InkWell(
                                  borderRadius: BorderRadius.circular(Dimensions.borderRadius1),
                                  onTap: () => Get.offNamed(Routes.login),
                                  child: Padding(
                                    padding: const EdgeInsets.all(Dimensions.space1),
                                    child: Text(
                                      'Login',
                                      style: AppStyle.body1SecondaryDark,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
    );
  }

  Widget _buildRegistrationForm() {
    return Obx(() {
      return Column(
        children: [
          AppTextField(
            title: 'Password',
            hintText: 'Enter strong password',
            obscureText: controller.isPasswordHidden,
            controller: controller.passwordController,
            onChanged: controller.checkPassword,
            validator: (val) => EquValidator.validate(controller.confirmPasswordController.text, val),
            suffixIcon: InkWell(
              onTap: controller.toggleVisibility,
              child: Icon(
                controller.isPasswordHidden ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Dimensions.space1),
            child: Obx(() {
              return PasswordStrengthBar(
                strength: controller.strength,
              );
            }),
          ),
          const SizedBox(height: Dimensions.minSpace),
          AppTextField(
            title: 'Confirm Password',
            hintText: 'Re-enter strong password',
            obscureText: controller.isPasswordHidden,
            controller: controller.confirmPasswordController,
            validator: (val) => EquValidator.validate(controller.passwordController.text, val),
            suffixIcon: InkWell(
              onTap: controller.toggleVisibility,
              child: Icon(
                controller.isPasswordHidden ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
        ],
      );
    });
  }
}
