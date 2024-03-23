import 'package:flutter/material.dart';
import 'package:money_trail/utils/constant/colors.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/constant/font_constant.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

class Tag extends StatelessWidget {
  const Tag({Key? key, required this.label, required this.color, this.textColor= Colors.white}) : super(key: key);
  final String label;
  final Color color;
  final Color? textColor ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: DimeUtil.xs),
      padding:
          const EdgeInsets.symmetric(horizontal: DimeUtil.md, vertical: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimeUtil.borderRadius),
          color: color),
      child: Text(
        label,
        style: StringUtilsStyle.getCustomStyle(
            color: textColor,
            fontFamily: Font.semiBold,
            size: 10.0),
      ),
    );
  }
}
