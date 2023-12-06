import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/constants/dimensions.dart';
import 'package:veegil/core/widget/header.dart';
import 'package:veegil/core/widget/transaction_list_item.dart';
import 'package:veegil/features/transaction_history/controllers/history_controller.dart';

class MainList extends StatelessWidget {
  final HistoryController controller;

  const MainList({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final ifHistorySorted = controller.isHistorySorted && controller.historyItems.isNotEmpty;
    final isTodaySorted = !controller.isHistorySorted && controller.todayTransaction.isNotEmpty;
    final isEarlierSorted = !controller.isHistorySorted && controller.earlierTransaction.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.space2),
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              if (ifHistorySorted) _buildSortedList(controller.selectedFilterType),
              if (isTodaySorted) _buildTodayList(),
              if (isEarlierSorted) _buildEarlierList(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PopupMenuButton(
                tooltip: 'Show filters',
                onSelected: controller.filterList,
                itemBuilder: (BuildContext context) {
                  return controller.filterTypes.map((selectedType) {
                    return PopupMenuItem(
                      value: selectedType,
                      child: Text(
                        selectedType,
                        style: AppStyle.button,
                      ),
                    );
                  }).toList();
                },
                child: TextButton.icon(
                  icon: const Icon(
                    Icons.filter_alt_outlined,
                    size: Dimensions.iconSize,
                  ),
                  label: Text(
                    'Filter',
                    style: AppStyle.titlePrimaryTint,
                  ),
                  onPressed: null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEarlierList() {
    return SliverStickyHeader(
      header: const Header(
        title: 'Earlier',
        color: AppColor.background,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) {
            return Column(
              children: [
                TransactionListItem(data: controller.earlierTransaction[index]),
                const SizedBox(height: Dimensions.space2),
              ],
            );
          },
          childCount: controller.earlierTransaction.length,
        ),
      ),
    );
  }

  Widget _buildTodayList() {
    return SliverStickyHeader(
      header: const Header(
        title: 'Today',
        color: AppColor.background,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) {
            return Column(
              children: [
                TransactionListItem(data: controller.historyItems[index]),
                const SizedBox(height: Dimensions.space2),
              ],
            );
          },
          childCount: controller.todayTransaction.length,
        ),
      ),
    );
  }

  Widget _buildSortedList(String headerText) {
    return SliverStickyHeader(
      header: Header(
        title: headerText,
        color: AppColor.background,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) {
            return Column(
              children: [
                TransactionListItem(data: controller.historyItems[index]),
                const SizedBox(height: Dimensions.space2),
              ],
            );
          },
          childCount: controller.historyItems.length,
        ),
      ),
    );
  }
}
