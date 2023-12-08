import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/constants/dimensions.dart';
import 'package:veegil/core/widgets/annotated_status_bar.dart';
import 'package:veegil/core/widgets/stats_bar_chart.dart';
import 'package:veegil/core/widgets/util.dart';
import 'package:veegil/features/get_started/controllers/dashboard_controller.dart';

class ProfileScreen extends GetView<DashboardController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: AnnotatedStatusBar(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildProfileImage(),
                _buildSavingsInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSavingsInfo() {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.space2),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Savings',
              style: AppStyle.title,
            ),
            const SizedBox(height: Dimensions.space1),
            Obx(() {
              return Text(
                controller.balance,
                style: AppStyle.headline3PrimaryDark,
              );
            }),
            const SizedBox(height: Dimensions.space3),
            Center(
              child: Text(
                'Statistics',
                style: AppStyle.headline5,
              ),
            ),
            const SizedBox(height: Dimensions.space2),
            Obx(() {
              return Visibility(
                visible: !controller.isTransactionLoading,
                child: StatsBarChart(controller: controller),
              );
            }),
            const SizedBox(height: Dimensions.space6),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.space2),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(Dimensions.space2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2000),
              color: AppColor.primaryMain,
              border: WidgetUtil.borderGreen,
            ),
            child: SizedBox(
              width: 30,
              height: 30,
              child: Center(
                child: Obx(() {
                  return Text(
                    controller.name[0],
                    style: AppStyle.headline5.apply(color: AppColor.white),
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: Dimensions.space2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Obx(() {
                      return Text(
                        controller.name,
                        style: AppStyle.headline5Primary.bold,
                      );
                    }),
                    const SizedBox(width: Dimensions.space1),
                    InkWell(
                      customBorder: const CircleBorder(),
                      onTap: controller.editName,
                      child: const Padding(
                        padding: EdgeInsets.all(Dimensions.space1),
                        child: Icon(
                          Icons.edit_outlined,
                          size: Dimensions.iconSize,
                          color: AppColor.primaryMain,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Dimensions.minSpace),
                Obx(() {
                  return Text(
                    controller.accountNumber,
                    style: AppStyle.subtitle1,
                  );
                })
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            customBorder: const CircleBorder(),
            onTap: controller.logout,
            child: const Padding(
              padding: EdgeInsets.all(Dimensions.space1),
              child: Icon(
                Icons.logout_rounded,
                size: Dimensions.iconSize,
                color: AppColor.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
