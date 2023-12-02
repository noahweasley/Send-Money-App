import 'package:get/get.dart';
import 'package:veegil/api/services/resources/managers/session_constants.dart';
import 'package:veegil/core/database/database.dart';
import 'package:veegil/core/navigation/app_routes.dart';
import 'package:veegil/features/auth/screen/login.dart';
import 'package:veegil/features/auth/screen/sign_up.dart';
import 'package:veegil/features/shared/bindings/main_binding.dart';
import 'package:veegil/features/get_started/screen/dashboard_screen.dart';
import 'package:veegil/features/get_started/screen/main_screen.dart';
import 'package:veegil/features/transaction/screens/transactions.dart';

abstract class AppRouter {
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
      name: Routes.main,
      binding: MainBinding(),
      transition: Transition.leftToRight,
      page: () => const MainScreen(),
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
      page: () => const TransactionsScreen(),
    ),
  ];

  static String getInitialRoute() {
    final database = DatabaseService.instance;
    final hasUserOnboard = database.getData(SessionConstants.hasUserOnboard, false);
    if (hasUserOnboard) {
      return Routes.login;
    } else {
      return Routes.login;
    }
  }
}
