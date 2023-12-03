import 'package:flutter/material.dart';
import 'package:veegil/api/models/transactions/transaction_model.dart';
import 'package:veegil/api/services/api_services.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/utilities/services.dart';
import 'package:veegil/core/widget/transaction_items.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});
  static const String id = 'transactions-page';

  @override
  State<TransactionHistoryScreen> createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  final Services _services = Services();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: _services.appBar(
        title: 'My Transactions',
        logout: Icons.logout_outlined,
        context: context,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: loadTransactions(),
      ),
    );
  }

  Widget loadTransactions() {
    return FutureBuilder(
        future: APIService.getTransactions(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<TransactionModel>?> model,
        ) {
          if (model.hasData) {
            return transactionsList(model.data);
          }
          if (!model.hasData) {
            return const Center(child: Text('No transaction'));
          }
          if (model.hasError) {
            return const Center(
              child: Text('Error loading transactions'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget transactionsList(transactions) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return TransactionItems(model: transactions[index]);
            },
          )
        ],
      ),
    );
  }
}
