import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_trail/screens/home_screen/home_controller.dart';
import 'package:money_trail/screens/main_controller.dart';
import 'package:money_trail/services/google_services_util.dart';
import 'package:money_trail/utils/StringUtils.dart';
import 'package:money_trail/utils/constant/colors.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/constant/font_constant.dart';
import 'package:money_trail/utils/constant/image_path.dart';
import 'package:money_trail/utils/constant/strings_constant.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

class TrailCard extends StatelessWidget {
  TrailCard({super.key});
  final HomeController homeController = Get.put(HomeController());
  final MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: DimeUtil.lg),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
        side: const BorderSide(color: ColorsUtil.baseBlackColor)
      ),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width * 0.58,
        padding: const EdgeInsets.all(DimeUtil.lg),
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
                      style: StringUtilsStyle.getHeadingFive(color: ColorsUtil.baseBlackColor),
                    ),
                    Image.asset(
                      ImagePath.IMAGE_CHIP,
                      width: 40,
                      height: 40,
                      alignment: Alignment.topRight,
                    ),
                  ],
                ),
                Obx(()=> Text(
                    homeController.isBalanceVisible ? "Rs. 100,000,000" : "XXX-XXX-XXX",
                    style: StringUtilsStyle.getHeadingSix(color: ColorsUtil.baseBlackColor),
                  ),
                ),
              ],
            ),
            Text(StringUtils.leftPad(MainController.email.hashCode.toString()), style: StringUtilsStyle.getHeadingFive(color: ColorsUtil.baseBlackColor), textAlign: TextAlign.center,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(StringConstant.CARD_HOLDER,style: StringUtilsStyle.getHeadingSeven(color: ColorsUtil.baseBlackColor),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(MainController.username, style:  StringUtilsStyle.getCustomStyle(color: ColorsUtil.baseBlackColor, fontFamily: Font.semiBold),),
                    Obx(()=> GestureDetector(
                        onTap: (){
                          homeController.setBalanceVisibility();
                        },
                        child: Icon(homeController.isBalanceVisible ? Icons.remove_red_eye : Icons.remove_red_eye_outlined)))

                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
