import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_trail/global_widgets/tag.dart';
import 'package:money_trail/screens/main_controller.dart';
import 'package:money_trail/utils/constant/colors.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(DimeUtil.md),
      margin: const EdgeInsets.all(DimeUtil.md),
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal:DimeUtil.xs),
                margin: const EdgeInsets.only(right: DimeUtil.xs),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft:
                        Radius.circular(DimeUtil.borderRadius),
                        bottomRight:
                        Radius.circular(DimeUtil.borderRadius))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat("dd")
                          .format(DateTime.parse("2024-03-17")),
                      style: StringUtilsStyle.getHeadingThree(
                          color: ColorsUtil.baseBlackColor),
                    ),
                    Text(
                      DateFormat("MMM")
                          .format(DateTime.parse("2024-03-17")),
                      style: StringUtilsStyle.getHeadingSix(
                          color: ColorsUtil.baseBlackColor),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: DimeUtil.xl6),
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Text(
                      "Dear ${MainController.username.split(" ")[0]}, your balance has been debited by Rs 100.",
                      maxLines: 3,
                      style: StringUtilsStyle.getHeadingSeven(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Tag(label: "DEDUCTED", color: Colors.red),
              Tag(label: "FOOD", color: Colors.yellow, textColor: ColorsUtil.baseBlackColor,),
              Tag(label: "GBL", color: Colors.black87),
            ],
          ),
        ],
      ),
    );
  }
}
