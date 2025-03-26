import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:send_money_app/core/constants/app_style.dart';
import 'package:send_money_app/core/constants/colors.dart';
import 'package:send_money_app/core/utilities/size_config.dart';
import 'package:send_money_app/core/widgets/annotated_status_bar.dart';
import 'package:send_money_app/features/get_started/controllers/landing_page_controller.dart';
import 'package:send_money_app/features/get_started/screen/dashboard_screen.dart';
import 'package:send_money_app/features/profile/screens/profile_screen.dart';
import 'package:send_money_app/features/transaction_history/screens/transaction_history.dart';

class LandingPageScreen extends GetView<LandingPageController> {
  const LandingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return AnnotatedStatusBar(
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Obx(() {
                  return IndexedStack(
                    index: controller.index,
                    children: const [
                      DashboardScreen(),
                      TransactionHistoryScreen(),
                      ProfileScreen(),
                    ],
                  );
                }),
              )
            ],
          ),
        ),
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            backgroundColor: AppColor.white2,
            iconSize: 24,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: AppStyle.subtitle2PrimaryDark,
            unselectedLabelStyle: AppStyle.subtitle2PrimaryDark,
            onTap: controller.onItemTap,
            currentIndex: controller.index,
            selectedItemColor: AppColor.green,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.payment_outlined),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_3_outlined),
                label: 'Profile',
              ),
            ],
          );
        }),
      ),
    );
  }
}
