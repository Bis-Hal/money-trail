import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:money_trail/screens/sign_in/sign_in_controller.dart';
import 'package:money_trail/utils/constant/colors.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

import '../constant/dime.dart';

class TextEditorStyle {
  String label;
  bool isObstructTextEnable;
  IconData? prefixIcon;
  IconData? suffixIcon;
  final SignInController signUpController = Get.put(SignInController());

  TextEditorStyle(
      {required this.label,
      this.isObstructTextEnable = false,
      this.prefixIcon,
      this.suffixIcon});

  InputDecoration getInputDecorator() {
    return InputDecoration(
      errorStyle: StringUtilsStyle.getHeadingSeven(color: ColorsUtil.baseBlackColor),
        suffixIcon: isObstructTextEnable
            ? GestureDetector(
                onTap: () {
                  signUpController.setObstruct();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: DimeUtil.sm, vertical: 18.0),
                  child: FaIcon(
                    signUpController.isObstruct
                        ? FontAwesomeIcons.eye
                        : FontAwesomeIcons.eyeSlash,
                    color: ColorsUtil.baseGreyColor,
                    size: DimeUtil.xl4,
                  ),
                ),
              )
            : const SizedBox(),
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(DimeUtil.sm),
                child: FaIcon(
                  prefixIcon,
                  color: ColorsUtil.primaryColor,
                ),
              )
            : null,
        label: Text(
          label,
          style: StringUtilsStyle.getHeadingSeven(color: ColorsUtil.baseGreyColor),
        ),
        labelStyle: StringUtilsStyle.getHeadingSeven(color: ColorsUtil.primaryColor),
        focusColor: ColorsUtil.primaryColor,
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorsUtil.baseBlackColor, width: 2.0),
            borderRadius: BorderRadius.circular(DimeUtil.borderRadius)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorsUtil.primaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(DimeUtil.borderRadius)));
  }
}
