import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_trail/utils/constant/dime.dart';

class BudgetPlaner extends StatelessWidget {
  const BudgetPlaner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (context, _) => Container(
              padding: const EdgeInsets.all(DimeUtil.sm),
              margin: const EdgeInsets.all(DimeUtil.sm),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: FaIcon(FontAwesomeIcons.shirt),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Clothes"),
                              Text("Rs 15,000"),

                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(DimeUtil.sm),
                    child: LinearProgressIndicator(
                      color: Colors.grey,
                      value: 40.0,
                    ),
                  )
                ],
              ),
            ));
  }
}
