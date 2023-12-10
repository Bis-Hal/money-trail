import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

class Indicator extends StatelessWidget {
  final title;
  final icon;
  final amount;
  var color;

  Indicator({ required this.title, required this.icon, required this.amount, this.color = Colors.green,Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      margin: const EdgeInsets.symmetric(vertical: DimeUtil.xs),
      padding: const EdgeInsets.all(DimeUtil.xs),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(DimeUtil.borderRadius),
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(DimeUtil.sm),
                child: FaIcon(
                  icon,
                  size: DimeUtil.xl,
                  color: Colors.white,
                ),
              ),
              Text(
                title,
                style: StringUtilsStyle.getHeadingFive(color: Colors.white)
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:  DimeUtil.sm),
            child: Text(
              amount,
              style: StringUtilsStyle.getHeadingSix(color: Colors.white)
            ),
          ),
        ],
      ),
    );
  }
}
