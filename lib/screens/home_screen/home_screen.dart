import 'package:flutter/material.dart';
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
        Indicator(),
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
