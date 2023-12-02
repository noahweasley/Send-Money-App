// ignore_for_file: unnecessary_overrides
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil/api/repositories/auth_repository.dart';
import 'package:veegil/api/services/requests/login_request/login_request.dart';
import 'package:veegil/api/services/resources/managers/session_manager.dart';

class LoginController extends GetxController {
  final userRepository = AuthRepository();
  final formKey = GlobalKey<FormState>();
  final phoneNumberTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final _isRememberMe = false.obs;
  bool get isRememberMe => _isRememberMe.value;
  set isRememberMe(bool value) => _isRememberMe.value = value;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  @override
  void onInit() {
    // TODO: Remove onInit() method
    super.onInit();
  }

  Future<void> login() async {
    final formState = formKey.currentState;

    if (formState!.validate()) {
      formState.save();
      isLoading = true;

      LoginRequest request = LoginRequest(
        phoneNumber: phoneNumberTextController.text,
        password: passwordTextController.text,
      );

      try {
        final response = await userRepository.loginAsync(request);
        SessionManager.setLoginDetails(response);
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
