import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:money_trail/model/model_transaction.dart';
import 'package:money_trail/utils/constant/colors.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/styles/text_editor_style.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

class Transaction extends StatelessWidget {
  final ModelTransaction transaction;
  const Transaction({required this.transaction,super.key});

  @override
  Widget build(BuildContext context) {
    var color = transaction.amount != null ? ColorsUtil.primaryColor : Colors.redAccent;
    return Card(
      color: Colors.white,
      elevation: 0.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(DimeUtil.xl)
                ),
                width: 4.0,
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.all(DimeUtil.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(transaction.title, style: StringUtilsStyle.getHeadingFive(),),
                    Text(transaction.type, style: StringUtilsStyle.getHeadingEight(),),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Rs ${transaction.amount}", style: StringUtilsStyle.getCustomStyle(size: DimeUtil.xl, color: color),),
              Text("13 Feb, 2024 ", style: StringUtilsStyle.getCustomStyle(size: DimeUtil.sm, color: Colors.black),),
            ],
          )

        ],
      ),
    );
  }
}
