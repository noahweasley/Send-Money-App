import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/constants/dimensions.dart';
import 'package:veegil/core/navigation/app_routes.dart';
import 'package:veegil/core/utilities/extensions/size_extensions.dart';
import 'package:veegil/core/widgets/action_card.dart';
import 'package:veegil/core/widgets/annotated_status_bar.dart';
import 'package:veegil/core/widgets/empty_list.dart';
import 'package:veegil/core/widgets/history_list_loading.dart';
import 'package:veegil/core/widgets/list_shimmer.dart';
import 'package:veegil/core/widgets/transaction_list_item.dart';
import 'package:veegil/features/get_started/controllers/dashboard_controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: AnnotatedStatusBar(
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: controller.refreshPage,
            child: SingleChildScrollView(
              child: Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAccountInfo(),
                    _buildActions(),
                    _buildRecentTransactions(),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountInfo() {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.space1),
      child: SizedBox(
        height: 230.h,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(Dimensions.space2),
          decoration: BoxDecoration(
            color: AppColor.white2,
            border: AppStyle.borderPrimaryDark,
            borderRadius: AppStyle.borderRadiusRoundedAllSides,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildGreeting(),
                  const Spacer(),
                  Obx(() {
                    return _buildSavingsInfo(
                      alignment: CrossAxisAlignment.end,
                      reason: 'Account No.',
                      value: controller.accountNumber,
                    );
                  }),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Obx(() {
                    return _buildSavingsInfo(
                      reason: 'Total Savings',
                      value: controller.balance,
                    );
                  }),
                  const Spacer(),
                  _buildAddMoneyButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.greeting,
          style: AppStyle.title,
        ),
        const SizedBox(height: Dimensions.minSpace),
        Text(
          controller.name,
          style: AppStyle.headline6,
        ),
      ],
    );
  }

  Widget _buildSavingsInfo({
    required String reason,
    required String value,
    CrossAxisAlignment? alignment,
  }) {
    return Column(
      crossAxisAlignment: alignment ?? CrossAxisAlignment.start,
      children: [
        Text(
          reason,
          style: AppStyle.title,
        ),
        const SizedBox(height: Dimensions.space1),
        Text(
          value,
          style: AppStyle.headline6,
        ),
      ],
    );
  }

  Widget _buildAddMoneyButton() {
    return Obx(() {
      return ElevatedButton.icon(
        onPressed: controller.isUserDetailsLoading ? null : () => Get.toNamed(Routes.topUp),
        icon: const Icon(
          Icons.add_outlined,
          color: AppColor.dark,
          size: Dimensions.iconSize,
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: AppColor.background,
          disabledBackgroundColor: AppColor.background.withOpacity(0.6),
          minimumSize: const Size(130, 40),
          side: const BorderSide(color: AppColor.primaryDark),
        ),
        label: Text(
          'Add money',
          style: AppStyle.body1PrimaryDark,
        ),
      );
    });
  }

  Widget _buildActions() {
    return LayoutBuilder(
      builder: (_, constraints) {
        return GridView.count(
          crossAxisCount: math.max(2, constraints.maxWidth.toInt() ~/ 200),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Obx(() {
              return ActionCard(
                enabled: !controller.isUserDetailsLoading,
                onTap: controller.topup,
                color: AppColor.red,
                iconData: Icons.savings_outlined,
                title: 'Top up',
                subtitle: 'Add money to wallet',
              );
            }),
            Obx(() {
              return ActionCard(
                enabled: !controller.isUserDetailsLoading,
                onTap: controller.navigateToWithdraw,
                color: AppColor.primaryMain,
                iconData: Icons.payment_outlined,
                title: 'Withdraw',
                subtitle: 'Withdraw from wallet',
              );
            }),
            Obx(() {
              return ActionCard(
                enabled: !controller.isUserDetailsLoading,
                onTap: controller.navigateToTransfer,
                color: AppColor.green,
                iconData: Icons.paid_outlined,
                title: 'Transfer',
                subtitle: 'Send money to loved ones',
              );
            }),
          ],
        );
      },
    );
  }

  Widget _buildRecentTransactions() {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.space2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest Transactions',
                style: AppStyle.body1Primary,
              ),
              InkWell(
                customBorder: const CircleBorder(),
                onTap: controller.showInfo,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.info_outline_rounded,
                    color: AppColor.primaryMain,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: Dimensions.space3),
          Obx(() {
            return ListShimmer(
              isLoading: controller.isTransactionLoading,
              itemCount: 10,
              loadingPlaceholder: const HistoryListLoading(),
              child: IndexedStack(
                index: controller.transactions.isEmpty ? 0 : 1,
                children: [
                  const EmptyList(
                    text: 'No transaction history',
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.transactions.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: Dimensions.space2);
                    },
                    itemBuilder: (context, index) {
                      return TransactionListItem(data: controller.transactions[index]);
                    },
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
