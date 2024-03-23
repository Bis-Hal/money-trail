import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

class Indicator extends StatelessWidget {

  final String title;
  final String icon;

  const Indicator(
      {required this.title, required this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DimeUtil.md , horizontal: DimeUtil.sm),
      child: Column(
        children: [
          Text("70%", style: StringUtilsStyle.getHeadingSeven(),),
          Padding(
            padding: const EdgeInsets.all(DimeUtil.xs),
            child: Image.asset(icon, width: 35.0, height: 35.0,),
          ),
          Text(title, style: StringUtilsStyle.getHeadingSeven(),)
        ],
      ),
    );
  }
}
