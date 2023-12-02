import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil/api/repositories/auth_repository.dart';
import 'package:veegil/api/services/requests/signup_request/signup_request.dart';
import 'package:veegil/core/navigation/app_routes.dart';
import 'package:veegil/core/widget/password_strength_bar.dart';

class SignupController extends GetxController {
  final passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
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
      if (!passwordRegex.hasMatch(password)) {
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

      SignupRequest request = SignupRequest(
        phoneNumber: phoneNumberController.text,
        password: passwordController.text,
      );

      try {
        isLoading = true;
        final response = await userRepository.signupAsync(request);
        if (response.data != null) {
          Get.offAllNamed(Routes.login);
        }
      } on Exception catch (err) {
        Get.snackbar(
          'Information',
          err.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      } finally {
        isLoading = false;
      }
    }
  }
}
