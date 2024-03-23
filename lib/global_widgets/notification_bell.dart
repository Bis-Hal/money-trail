import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:money_trail/main.dart';
import 'package:money_trail/screens/main_controller.dart';
import 'package:money_trail/screens/notifications/NotificationList.dart';
import 'package:money_trail/utils/constant/colors.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/constant/font_constant.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

class NotificationBell extends StatelessWidget {
  const NotificationBell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    return Obx(()=>GestureDetector(
      onTap: (){
        Get.to(NotificationList());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal:DimeUtil.xl2),
        child: Stack(alignment: Alignment.topRight,
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Icons.notifications,
                color: ColorsUtil.baseBlackColor,
              ),
              mainController.credits.isNotEmpty ? Positioned(
                bottom: 12.0,
                left: 14.0,
                child:Container(
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      color: ColorsUtil.baseRed,
                      borderRadius: BorderRadius.circular(DimeUtil.borderFullCircle)),
                  child: Center(
                      child: Text(
                        mainController.credits.length <= 99 ? "${mainController.credits.length}" : "99+",
                        style: StringUtilsStyle.getCustomStyle(
                            size: 10.0,
                            color: ColorsUtil.baseWhiteColor,
                            fontFamily: Font.bold),
                      )),
                ),
              ) : const SizedBox.shrink(),
            ]),
      ),
    )
    );
  }
}
