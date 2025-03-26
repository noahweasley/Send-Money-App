import 'package:get/get.dart';
import 'package:send_money_app/api/services/resources/managers/session_manager.dart';
import 'package:send_money_app/core/navigation/app_routes.dart';
import 'package:send_money_app/features/authentication/screen/login.dart';
import 'package:send_money_app/features/authentication/screen/sign_up.dart';
import 'package:send_money_app/features/get_started/screen/dashboard_screen.dart';
import 'package:send_money_app/features/get_started/screen/landing_page_screen.dart';
import 'package:send_money_app/features/onboarding/screens/onboarding_screen.dart';
import 'package:send_money_app/features/shared/bindings/main_binding.dart';
import 'package:send_money_app/features/transaction_history/screens/transaction_history.dart';
import 'package:send_money_app/features/transfer/screens/top_up_waller_screen.dart';
import 'package:send_money_app/features/transfer/screens/transfer_screen.dart';
import 'package:send_money_app/features/withdraw/screens/withdraw_screen.dart';

class AppRouter {
  static final pages = [
    GetPage(
      name: Routes.login,
      binding: MainBinding(),
      transition: Transition.leftToRight,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.signUp,
      binding: MainBinding(),
      transition: Transition.leftToRight,
      page: () => const SignupScreen(),
    ),
    GetPage(
      name: Routes.landingPage,
      binding: MainBinding(),
      transition: Transition.leftToRight,
      page: () => const LandingPageScreen(),
    ),
    GetPage(
      name: Routes.topUp,
      binding: MainBinding(),
      transition: Transition.leftToRight,
      page: () => const TopupWalletScreen(),
    ),
    GetPage(
      name: Routes.home,
      binding: MainBinding(),
      transition: Transition.leftToRight,
      page: () => const DashboardScreen(),
    ),
    GetPage(
      name: Routes.transactions,
      binding: MainBinding(),
      transition: Transition.leftToRight,
      page: () => const TransactionHistoryScreen(),
    ),
    GetPage(
      name: Routes.withdraw,
      binding: MainBinding(),
      transition: Transition.leftToRight,
      page: () => const WithdrawScreen(),
    ),
    GetPage(
      name: Routes.transfer,
      binding: MainBinding(),
      transition: Transition.leftToRight,
      page: () => const TransferScreen(),
    ),
    GetPage(
      name: Routes.onboarding,
      binding: MainBinding(),
      transition: Transition.leftToRight,
      page: () => const OnBoardingScreen(),
    ),
  ];

  static String get initialRoute {
    final isLoggedIn = SessionManager.isUserLoggedIn();
    final hasUserOnboard = SessionManager.hasUserOnboard();

    if (isLoggedIn) {
      return Routes.landingPage;
    } else if (hasUserOnboard) {
      return Routes.login;
    } else {
      return Routes.onboarding;
    }
  }
}
