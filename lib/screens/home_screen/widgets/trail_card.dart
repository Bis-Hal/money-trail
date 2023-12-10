import 'package:flutter/material.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/constant/image_path.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

import '../../../utils/constant/strings_constant.dart';

class TrailCard extends StatelessWidget {
  const TrailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(vertical: DimeUtil.lg),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DimeUtil.borderRadius),
      ),
      child: Container(
        width: double.infinity,
        height: 150.0,
        padding: const EdgeInsets.all(DimeUtil.sm),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagePath.IMAGE_MONEY),
                fit: BoxFit.contain,
                alignment: Alignment.bottomRight)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${StringConstant.RS} 73,000",
                    style: StringUtilsStyle.getHeadingOne()),
                Text(
                  StringConstant.BALANCE,
                  style: StringUtilsStyle.getHeadingFour()
                ),
              ],
            ),
            Text(
              StringConstant.SLOGON,
              style: StringUtilsStyle.getHeadingSeven()
            ),
          ],
        ),
      ),
    );
  }
}
