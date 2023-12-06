import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/constants/dimensions.dart';
import 'package:veegil/core/widget/app_bar.dart';
import 'package:veegil/core/widget/empty_list.dart';
import 'package:veegil/core/widget/history_list_loading.dart';
import 'package:veegil/core/widget/list_shimmer.dart';
import 'package:veegil/features/transaction_history/controllers/history_controller.dart';
import 'package:veegil/features/transaction_history/screens/components/main_list.dart';

class TransactionHistoryScreen extends GetView<HistoryController> {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultStickyHeaderController(
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: CustomAppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'History',
            style: AppStyle.title,
          ),
        ),
        body: Obx(() {
          return ListShimmer(
            padding: const EdgeInsets.all(Dimensions.space2),
            isLoading: controller.isLoading,
            itemCount: 10,
            loadingPlaceholder: const HistoryListLoading(),
            child: IndexedStack(
              index: controller.historyItems.isEmpty ? 0 : 1,
              children: [
                const EmptyList(
                  text: 'No transaction history',
                ),
                RefreshIndicator(
                  onRefresh: controller.retrieveTransactionHistory,
                  child: MainList(controller: controller),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
