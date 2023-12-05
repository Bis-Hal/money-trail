import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_trail/utils/dime.dart';

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
      padding: const EdgeInsets.all(sm),
      margin: const EdgeInsets.all(sm),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: FaIcon(
                  icon,
                  size: 24.0,
                  color: Colors.white,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontFamily: "Titillium Web SemiBold"),
              ),
            ],
          ),
          Text(
            amount,
            style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontFamily: "Titillium Web SemiBold"),
          ),
        ],
      ),
    );
  }
}
