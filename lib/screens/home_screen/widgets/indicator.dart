import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

class Indicator extends StatelessWidget {

  final title;
  final percentage;
  var color;

  Indicator(
      {required this.title,
      required this.percentage,
      this.color = Colors.green,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: color,
          height: 70.0,
          width: (percentage / 100)  * (MediaQuery.of(context).size.width - DimeUtil.xl) ,
          child: const SizedBox(

          ),
        ),
        Text(
          "$percentage %",
          style: StringUtilsStyle.getCustomStyle(size: 28.0),
        ),
        Text(
          title,
          style: StringUtilsStyle.getCustomStyle(size: 12.0),
        ),
      ],
    );
  }
}
