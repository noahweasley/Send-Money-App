import 'package:flutter/material.dart';
import 'package:veegil/api/services/responses/transaction_history_response/transaction_history_response.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/constants/dimensions.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction data;

  const TransactionListItem({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final clrStyle = AppStyle.title.apply(color: data.type == Transaction.credit ? AppColor.green : AppColor.red);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(Dimensions.space2),
      decoration: BoxDecoration(
        color: AppColor.white2,
        border: AppStyle.borderPrimaryDark,
        borderRadius: AppStyle.borderRadiusRoundedAllSides,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.dType,
                style: clrStyle,
              ),
              const SizedBox(height: Dimensions.space2),
              Text(
                data.dPhoneNumber,
                style: AppStyle.subtitle1,
              ),
              const SizedBox(height: Dimensions.space1),
              Text(
                data.dCreated,
                style: AppStyle.subtitle1,
              ),
            ],
          ),
          Text(
            data.dAmount,
            style: clrStyle,
          ),
        ],
      ),
    );
  }
}
