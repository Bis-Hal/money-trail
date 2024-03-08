import 'package:flutter/material.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/constant/image_path.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

class TrailCard extends StatelessWidget {
  const TrailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(vertical: DimeUtil.lg),
      color: Colors.teal[800],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Container(
        width: double.infinity,
        height: 200.0,
        padding: const EdgeInsets.all(DimeUtil.lg),
        child: Container(
          // decoration: const BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage(ImagePath.IMAGE_CARD),
          //         fit: BoxFit.contain,
          //       alignment: Alignment.bottomRight
          //     )
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Balance",
                        style: StringUtilsStyle.getHeadingFive(color: Colors.white),
                      ),
                      Image.asset(
                        ImagePath.IMAGE_CHIP,
                        width: 40,
                        height: 40,
                        alignment: Alignment.topRight,
                      ),
                    ],
                  ),
                  Text(
                    "Rs. 100,000,000",
                    style: StringUtilsStyle.getHeadingSix(color: Colors.white),
                  ),
                ],
              ),
              Text("**** **** **** 0912", style: StringUtilsStyle.getHeadingFive(color: Colors.white),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Card Holder",style: StringUtilsStyle.getHeadingSeven(color: Colors.white),),
                  Text("Maharjan Bishal", style:  StringUtilsStyle.getHeadingSeven(color: Colors.white),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
