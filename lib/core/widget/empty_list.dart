import 'package:flutter/material.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/dimensions.dart';

class EmptyList extends StatelessWidget {
  final String text;
  const EmptyList({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.hourglass_empty),
          const SizedBox(height: Dimensions.space3),
          Text(
            text,
            style: AppStyle.title.bold,
          ),
        ],
      ),
    );
  }
}
