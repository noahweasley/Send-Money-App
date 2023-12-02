import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil/api/repositories/auth_repository.dart';
import 'package:veegil/api/services/requests/signup_request/signup_request.dart';
import 'package:veegil/core/navigation/app_routes.dart';
import 'package:veegil/core/utilities/extensions/error_extension.dart';
import 'package:veegil/core/validators/regex_patterns.dart';
import 'package:veegil/core/widget/notifiers.dart';
import 'package:veegil/core/widget/password_strength_bar.dart';

class SignupController extends GetxController {
  final userRepository = AuthRepository();
  final formKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final _strength = Rx(Strength.weak);
  Strength get strength => _strength.value;
  set strength(Strength value) => _strength.value = value;

  final _isPasswordHidden = false.obs;
  bool get isPasswordHidden => _isPasswordHidden.value;
  set isPasswordHidden(bool value) => _isPasswordHidden.value = value;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  @override
  void onInit() {
    // TODO: Remove onInit() method
    super.onInit();
  }

  void toggleVisibility() {
    isPasswordHidden = !isPasswordHidden;
  }

  void checkPassword(String _) {
    final password = passwordController.text;
    if (password.isEmpty) {
      strength = Strength.weak;
    } else if (password.length < 8) {
      strength = Strength.weak;
    } else {
      if (!RegexPattern.securePassword.hasMatch(password)) {
        strength = Strength.moderate;
      } else {
        strength = Strength.secure;
      }
    }
  }

  Future<void> signup() async {
    final form = formKey.currentState;

    if (form!.validate()) {
      form.save();

      if (strength != Strength.secure) {
        Notifiers.showAppDialog(
            title: 'Password not secure',
            subtitle: 'Password should be at least 8 characters long and include a mix of'
                ' uppercase and lowercase letters, numbers,'
                ' and special characters (such as !, @, #, \$, etc.) for added security',
            buttons: [
              DialogButton(
                label: 'Ok',
                onTap: Get.back,
              ),
            ]);
        return;
      }

      final SignupRequest request = SignupRequest(
        phoneNumber: phoneNumberController.text,
        password: passwordController.text,
      );

      try {
        isLoading = true;
        final response = await userRepository.signupAsync(request);
        if (response.data != null) {
          final timer = Timer(const Duration(seconds: 3), () => Get.offAllNamed(Routes.login));

          await Notifiers.showAppDialog(
            dialogType: NotificationType.message,
            title: 'Success',
            subtitle: 'You will be navigated to login in 3 seconds',
            buttons: [
              DialogButton(
                label: 'Go now',
                onTap: () {
                  timer.cancel();
                  Get.offAllNamed(Routes.login);
                },
              ),
            ],
          );
        }
      } on Exception catch (err) {
        Notifiers.showSnackBar(
          message: err.neatMessage,
        );
      } finally {
        isLoading = false;
      }
    }
  }
}
