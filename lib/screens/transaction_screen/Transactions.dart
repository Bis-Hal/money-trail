import 'package:flutter/material.dart';
import 'package:money_trail/screens/home_screen/widgets/transaction.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

class Transactions extends StatelessWidget {
   Transactions({Key? key}) : super(key: key);
  final transactions= {
    "29th Fri, 2023" : [
      Transaction(),
      Transaction(),
      Transaction(),
      Transaction(),
    ],
    "30th Sat, 2023" : [
      Transaction(),
      Transaction(),
      Transaction(),
      Transaction(),
    ],

  };
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DimeUtil.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: DimeUtil.lg),
            child: Text("Transactions",style: StringUtilsStyle.getHeadingTwo(),),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ...transactions.entries.map((e) => Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(DimeUtil.lg),
                        margin: const EdgeInsets.all(DimeUtil.xs),
                        color: Colors.grey[200],
                        width: double.infinity,
                        child: Text(e.key, style: StringUtilsStyle.getHeadingFour(), textAlign: TextAlign.end,),
                      ),
                      ...e.value.map((e) => e)
                    ],
                  ))
                ],
              ),
            ),
          )

        ]
      ),
    );
  }
}
