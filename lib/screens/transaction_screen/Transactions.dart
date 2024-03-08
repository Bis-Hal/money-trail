import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_trail/screens/home_screen/widgets/transaction.dart';
import 'package:money_trail/screens/transaction_screen/transaction_controller.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

class Transactions extends StatelessWidget {
  Transactions({super.key});
  final TransactionController transactionController = Get.put(TransactionController());

  void init() {
    transactionController.setTransactionsByDates();
    print("HIT");
  }


  @override
  Widget build(BuildContext context) {
    init();
    return Padding(
      padding: const EdgeInsets.all(DimeUtil.md),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: DimeUtil.lg),
          child: Text(
            "Transactions",
            style: StringUtilsStyle.getHeadingTwo(),
          ),
        ),

        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ...transactionController.transactionsByDates.entries.map((entry) => Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(DimeUtil.md),
                      child: Text(entry.key, style: StringUtilsStyle.getHeadingSix(),),
                    ),
                    ...entry.value.map((transaction) => Transaction(transaction: transaction,) )
                  ],
                ))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
