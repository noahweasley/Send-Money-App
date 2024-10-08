import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/utilities/size_config.dart';
import 'package:veegil/features/get_started/controllers/landing_page_controller.dart';
import 'package:veegil/features/get_started/screen/dashboard_screen.dart';
import 'package:veegil/features/profile/screens/profile_screen.dart';
import 'package:veegil/features/transaction_history/screens/transaction_history.dart';

class LandingPageScreen extends GetView<LandingPageController> {
  const LandingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
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
    );
  }
}
