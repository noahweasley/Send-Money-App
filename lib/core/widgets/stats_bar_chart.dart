import 'package:flutter/material.dart';
import 'package:veegil/api/services/responses/transaction_history_response/transaction_history_response.dart';

class StatsBarChart extends StatelessWidget {
  final List<Transaction> data;

  const StatsBarChart({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
