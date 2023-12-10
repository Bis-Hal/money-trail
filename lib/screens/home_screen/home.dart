import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_trail/screens/home_screen/widgets/indicator.dart';
import 'package:money_trail/screens/home_screen/widgets/trail_card.dart';
import 'package:money_trail/screens/home_screen/widgets/transaction.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/constant/strings_constant.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(DimeUtil.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TrailCard(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Indicator(
                  title: StringConstant.INCOME,
                  icon: FontAwesomeIcons.wallet,
                  amount: "150,000"),
              Indicator(
                title: StringConstant.EXPENSES,
                icon: FontAwesomeIcons.wallet,
                amount: "30,000",
                color: Colors.red,
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(DimeUtil.sm),
            child: Text(
              StringConstant.TRANSACTION,
              style: StringUtilsStyle.getHeadingThree(),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, _) => Transaction(),
            itemCount: 10,
            scrollDirection: Axis.vertical,
          ))
        ],
      ),
    );
  }
}
