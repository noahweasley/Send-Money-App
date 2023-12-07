import 'package:flutter/material.dart';
import 'package:veegil/api/models/transactions/transaction_model.dart';
import 'package:veegil/core/utilities/services.dart';

class TransactionItems extends StatelessWidget {
  final TransactionModel? model;
  const TransactionItems({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    final Services services = Services();

    // convert MongoDB timestamp
    final DateTime dateTime = services.getFormattedDateFromFormattedString(
        value: model!.transactionTime, currentFormat: 'yyyy-MM-ddTHH:mm:ssZ', desiredFormat: 'MM/dd/yyyy hh:mm a');

    return ListTile(
      leading: SizedBox(
        width: MediaQuery.of(context).size.width / 6,
        child: Text(services.formatPrice(amount: model!.transactionAmount, context: context)),
      ),
      title: SizedBox(
        width: MediaQuery.of(context).size.width / 4.5,
        child: Text('${model!.phoneNumber}',
            overflow: TextOverflow.ellipsis, style: const TextStyle(overflow: TextOverflow.ellipsis)),
      ),
      subtitle: Text('${model!.transactionType}-',
          style: TextStyle(color: model!.transactionType == 'Transfer' ? Colors.green : Colors.red)),
      trailing: Column(
        children: [
          Text(
            dateTime.toString(),
            maxLines: 1,
            style: const TextStyle(overflow: TextOverflow.ellipsis),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
