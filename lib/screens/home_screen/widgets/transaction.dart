import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

class Transaction extends StatelessWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(DimeUtil.lg),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const FaIcon(FontAwesomeIcons.shopify),
                Padding(
                  padding: const EdgeInsets.all(DimeUtil.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Spotify", style: StringUtilsStyle.getHeadingFour(),),
                      Text("Cash", style: StringUtilsStyle.getHeadingEight(),),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Rs 1580",  style: StringUtilsStyle.getHeadingFive(),),
                Text("Fri, 04 April 2023", style: StringUtilsStyle.getHeadingSeven(),),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
