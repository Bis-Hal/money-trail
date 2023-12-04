import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Transaction extends StatelessWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  FaIcon(FontAwesomeIcons.shopify),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Spotify", style: TextStyle(fontFamily: "Titillium Web Bold", fontSize: 16.0),),
                        Text("Cash", style: TextStyle(fontFamily: "Titillium Web Regular", fontSize: 12.0),),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Rs 1580",  style: TextStyle(fontFamily: "Titillium Web Bold", fontSize: 18.0),),
                  Text("Fri, 04 April 2023", style: TextStyle(fontFamily: "Titillium Web Regular", fontSize: 14.0),),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
