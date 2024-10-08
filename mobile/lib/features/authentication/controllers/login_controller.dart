import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil/api/repositories/auth_repository.dart';
import 'package:veegil/api/services/requests/login_request/login_request.dart';
import 'package:veegil/api/services/resources/managers/session_manager.dart';
import 'package:veegil/core/navigation/app_routes.dart';
import 'package:veegil/core/utilities/extensions/error_extension.dart';
import 'package:veegil/core/widgets/notifiers.dart';

class LoginController extends GetxController {
  final authRepository = AuthRepository();
  final formKey = GlobalKey<FormState>();
  final phoneNumberTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final _isRememberMe = false.obs;
  bool get isRememberMe => _isRememberMe.value;
  set isRememberMe(bool value) => _isRememberMe.value = value;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  Future<void> login() async {
    final formState = formKey.currentState;

    if (formState!.validate()) {
      formState.save();
      isLoading = true;

      final LoginRequest request = LoginRequest(
        phoneNumber: phoneNumberTextController.text,
        password: passwordTextController.text,
      );

      try {
        final response = await authRepository.loginAsync(request);
        await Future.wait([
          SessionManager.writeAuthorizationToken(response.data.token),
          SessionManager.writeUserAccountNumber(phoneNumberTextController.text),
          SessionManager.writeIsUserLoggedIn(isRememberMe),
        ]);

        Get.offAllNamed(Routes.landingPage);
      } on Exception catch (err) {
        Notifiers.showSnackBar(
          type: NotificationType.warning,
          message: err.neatMessage,
        );
      } finally {
        isLoading = false;
      }
    }
  }
}
