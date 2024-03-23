import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:intl/intl.dart';
import 'package:money_trail/screens/expense_screen/manual_trail_manager_controller.dart';
import 'package:money_trail/utils/constant/colors.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/constant/font_constant.dart';
import 'package:money_trail/utils/styles/text_editor_style.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

class ManualTrailManager extends StatefulWidget {
  const ManualTrailManager({Key? key}) : super(key: key);

  @override
  State<ManualTrailManager> createState() => _ManualTrailManagerState();
}

class _ManualTrailManagerState extends State<ManualTrailManager> {
  int currentIndex = 0;

  static const categories = [
    "FOOD",
    "CLOTHES",
    "COSMETICS",
    "PATHAO FOOD",
    "PATHAO DRIVE",
    "ELECTRONICS",
    "ONLINE SERVICES",
    "OTHERS"
  ];

  @override
  Widget build(BuildContext context) {
    ManualTrailManagerController addExpenseController = Get.put(ManualTrailManagerController());
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.all(DimeUtil.sm),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("EXPENSE TRACKER SETTINGS",
                    style: StringUtilsStyle.getHeadingFour()),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: DimeUtil.xl, horizontal: DimeUtil.md),
                  child: Text("Add/Disable expenses",
                      style: StringUtilsStyle.getHeadingSix(
                          color: Colors.grey[700])),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100.0,
                  child: InfiniteCarousel.builder(
                      itemCount: categories.length,
                      onIndexChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemExtent: 135.0,
                      itemBuilder: (context, itemIndex, realIndex) {
                        return Column(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.utensils,
                              size: currentIndex == itemIndex ? 56.0 : 32.0,
                              color: currentIndex == itemIndex
                                  ? ColorsUtil.primaryColor
                                  : ColorsUtil.baseBlackColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(DimeUtil.xs),
                              child: Text(
                                currentIndex == itemIndex
                                    ? categories[currentIndex]
                                    : "",
                                style: StringUtilsStyle.getCustomStyle(
                                    fontFamily: Font.semiBold,
                                    color: ColorsUtil.baseGreyColor),
                              ),
                            )
                          ],
                        );
                      }),
                ),
                categories[currentIndex].isCaseInsensitiveContains("OTHERS")
                    ? Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: DimeUtil.md),
                        child: TextField(
                          textAlign: TextAlign.right,
                          cursorColor: ColorsUtil.primaryColor,
                          textAlignVertical: TextAlignVertical.bottom,
                          style: StringUtilsStyle.getCustomStyle(
                              size: 40.0,
                              color: ColorsUtil.baseGreyColor,
                              fontFamily: Font.semiBold),
                          decoration: TextEditorStyle(label: "OTHERS")
                              .getBorderStyleNone(),
                        ),
                      )
                    : const SizedBox(),
                Container(
                  width: double.infinity,
                  child: Text(
                    DateFormat("dd MMM, yy").format(DateTime.now()),
                    style: StringUtilsStyle.getHeadingSix(),
                    textAlign: TextAlign.right,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: DimeUtil.md, right: DimeUtil.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Amount",
                            style: StringUtilsStyle.getHeadingSeven(
                                color: ColorsUtil.baseGreyColor),
                          ),
                          Text(
                            "NPR",
                            style: StringUtilsStyle.getHeadingOne(
                                color: ColorsUtil.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.right,
                      cursorColor: ColorsUtil.primaryColor,
                      textAlignVertical: TextAlignVertical.bottom,
                      style: StringUtilsStyle.getCustomStyle(
                          size: 40.0,
                          color: ColorsUtil.baseGreyColor,
                          fontFamily: Font.semiBold),
                      decoration:
                          TextEditorStyle(label: "O").getBorderStyleNone(),
                    ))
                  ],
                ),
              ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.all(DimeUtil.xl),
        width: double.infinity,
        child: FloatingActionButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DimeUtil.borderRadius)),
          backgroundColor: ColorsUtil.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(DimeUtil.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(
                    angle: -1.5,
                    child: const FaIcon(
                      FontAwesomeIcons.shoePrints,
                      color: ColorsUtil.baseWhiteColor,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: DimeUtil.md),
                  child: Text(
                    "Add Trail",
                    style: StringUtilsStyle.getHeadingSix(
                        color: ColorsUtil.baseWhiteColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
