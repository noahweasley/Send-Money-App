import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:send_money_app/api/services/resources/managers/session_manager.dart';
import 'package:send_money_app/core/constants/assets.dart';
import 'package:send_money_app/core/navigation/app_routes.dart';
import 'package:send_money_app/features/onboarding/screens/onboarding_items.dart';

class OnBoardingController extends GetxController {
  final currentIndex = 0.obs;
  final pageController = CarouselSliderController();

  final List<OnBoardingItem> onBoardingItems = [
    OnBoardingItem(
      Assets.transferMoney,
      'Send money to loved ones easily, on the go!',
    ),
    OnBoardingItem(
      Assets.cashPayment,
      'Withdraw money without any stress',
    ),
    OnBoardingItem(
      Assets.topup,
      'View personalized transaction history',
    ),
  ];

  Future<void> navigateToMain() async {
    await SessionManager.writeIsUserOnBoarded(true);
    Get.offAllNamed(Routes.login);
  }

  void onDotClicked(int index) {
    pageController.animateToPage(
      index,
      curve: Curves.easeIn,
    );
  }

  void onPageChanged(int index, CarouselPageChangedReason _) {
    currentIndex.value = index;
  }
}
