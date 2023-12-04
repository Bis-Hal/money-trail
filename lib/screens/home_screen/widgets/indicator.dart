import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_trail/utils/dime.dart';

class Indicator extends StatelessWidget {
  const Indicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(sm),
      margin: const EdgeInsets.all(sm),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(15.0),
        
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: FaIcon(FontAwesomeIcons.wallet, size: 24.0, color: Colors.white,),
              ),
              Text("Income", style: TextStyle(fontSize: 18.0, color: Colors.white, fontFamily: "Titillium Web SemiBold"),),
            ],
          ),
          Text("450,000", style: TextStyle(fontSize: 24.0, color: Colors.white, fontFamily: "Titillium Web SemiBold"),),


        ],
      ),
    );
  }
}
