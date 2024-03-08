import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_trail/utils/constant/dime.dart';

class BudgetPlaner extends StatelessWidget {
  const BudgetPlaner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(
        PieChartData(sectionsSpace: 0.0, centerSpaceRadius: 0.0, sections: [
      PieChartSectionData(
          value: 3.0,
          color: Colors.green,
          radius: 100,
          badgeWidget: Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(DimeUtil.borderFullCircle),
                  color: Colors.black),
              padding: const EdgeInsets.all(DimeUtil.md),
              child: const FaIcon(
                FontAwesomeIcons.bowlFood,
                color: Colors.white,
              )),
          badgePositionPercentageOffset: 1.0,),
      PieChartSectionData(value: 1.0, color: Colors.red, radius: 100),
      PieChartSectionData(value: 4.0, color: Colors.orangeAccent, radius: 100),
    ]));
  }
}
