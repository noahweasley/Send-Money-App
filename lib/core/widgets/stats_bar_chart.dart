import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/dimensions.dart';
import 'package:veegil/features/get_started/controllers/dashboard_controller.dart';

class StatsBarChart extends StatelessWidget {
  final DashboardController controller;

  const StatsBarChart({
    super.key,
    required this.controller,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.space1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: 50,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.grey,
                      getTooltipItem: (a, b, c, d) => null,
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitles,
                        reservedSize: 58,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 42,
                        interval: 1,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: controller.showingBarGroups,
                  gridData: const FlGridData(show: false),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 10) {
      text = '10';
    } else if (value == 20) {
      text = '20';
    } else if (value == 30) {
      text = '30';
    } else if (value == 40) {
      text = '40';
    } else if (value == 49) {
      text = '50';
    } else {
      return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: Dimensions.space1,
      child: Text(
        text,
        style: AppStyle.subtitle1PrimaryTint,
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'July', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

    return SideTitleWidget(
        axisSide: meta.axisSide,
        space: Dimensions.space3,
        child: Transform.rotate(
          angle: math.pi / 4,
          child: Text(
            titles[value.toInt()],
            style: AppStyle.subtitle1PrimaryDark,
          ),
        ));
  }
}
