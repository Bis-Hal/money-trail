import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_trail/screens/main_controller.dart';
import 'package:money_trail/services/google_services_util.dart';
import 'package:money_trail/utils/constant/colors.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/constant/font_constant.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(DimeUtil.xs),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(DimeUtil.md)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: DimeUtil.md),
              child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: DimeUtil.md),
                    child: ClipOval(
                      child: Image.network(
                        MainController.photoUrl,
                        width: 40.0,
                        height: 40.0,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        MainController.username,
                        style: StringUtilsStyle.getHeadingFive(),
                      ),
                      Text(
                        MainController.email,
                        style: StringUtilsStyle.getCustomStyle(
                            fontFamily: Font.semiBold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            shadowColor: ColorsUtil.baseWhiteColor,
            color: ColorsUtil.baseWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DimeUtil.md),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: DimeUtil.md),
              child: Column(
                children: [buildGestureDetector("Link", Icons.email_sharp)],
              ),
            ),
          ),
          DropdownButton(
              elevation: 0,
              isExpanded: true,
              padding: EdgeInsets.all(DimeUtil.lg),
              hint: Text("Change Language"),
              items: [
                DropdownMenuItem(
                  value: 1,
                  child: buildGestureDetector("English", Icons.flag),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: buildGestureDetector("Nepali", Icons.language),
                ),
              ],
              // items: [],
              onChanged: (value) {}),
          // buildGestureDetector("Change Language", Icons.language),
          // buildGestureDetector("Link", Icons.mail),
          // buildGestureDetector("Report an Issue", Icons.report),
          GestureDetector(
              onTap: () {
                GoogleServices().googleSignOut();
                mainController.setLoggedIn();
              },
              child: buildGestureDetector("Logout", Icons.login)),
        ]));
  }

  Widget buildGestureDetector(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(DimeUtil.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: DimeUtil.md),
                child: Icon(
                  icon,
                  color: ColorsUtil.baseBlackColor,
                ),
              ),
              Text(
                title,
                style: StringUtilsStyle.getHeadingFive(),
              ),
            ],
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MainController.email,
                  style: StringUtilsStyle.getHeadingSeven(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
