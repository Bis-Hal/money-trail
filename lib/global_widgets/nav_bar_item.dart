import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_trail/screens/main_controller.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/constant/font_constant.dart';

import '../utils/constant/colors.dart';
import '../utils/styles/text_styles.dart';

class NavBarItem extends StatelessWidget {

  int index;
  String label;
  IconData iconData;
  MaterialColor? color = ColorsUtil.primaryColor;

  NavBarItem({Key? key, required this.index, this.color, required this.label, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    return Obx(()=>GestureDetector(
        onTap: (){
          mainController.setCurrentIndex(index);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: DimeUtil.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(iconData, color: Colors.orangeAccent, size: 27, shadows: mainController.currentIndex !=index ?[] :[Shadow(blurRadius: 10.0, color: Colors.grey[600]!, offset: Offset.fromDirection(5.0))],),
             Text(label, style: StringUtilsStyle.getCustomStyle(color:ColorsUtil.baseWhiteColor , fontFamily: Font.semiBold, size: 12.0),)
            ],
          ),
        ),
      ),
    );
  }
}
