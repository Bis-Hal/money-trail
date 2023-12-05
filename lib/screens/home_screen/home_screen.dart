import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_trail/screens/home_screen/widgets/indicator.dart';
import 'package:money_trail/screens/home_screen/widgets/trail_card.dart';
import 'package:money_trail/screens/home_screen/widgets/transaction.dart';
import 'package:money_trail/utils/dime.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TrailCard(),
        Indicator(title: "Income", icon : FontAwesomeIcons.wallet,amount: "150,000"),
        Indicator(title: "Expenses", icon: FontAwesomeIcons.wallet, amount:"30,000", color: Colors.red,),
        Padding(
          padding: const EdgeInsets.all(sm),
          child: Text(
            "Transaction",
            style: TextStyle(fontFamily: "Titillium Web Bold", fontSize: 28.0),
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, _) => Transaction(),
          itemCount: 10,
          scrollDirection: Axis.vertical,
        ))
      ],
    );
  }
}
