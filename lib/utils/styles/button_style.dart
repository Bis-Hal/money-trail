import 'package:flutter/material.dart';
import 'package:money_trail/utils/constant/colors.dart';
import 'package:money_trail/utils/constant/dime.dart';

class ButtonStyleUtil{
  ButtonStyle getButtonStyle(){
    return ButtonStyle(
      mouseCursor: const MaterialStatePropertyAll(
          MouseCursor.uncontrolled),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DimeUtil.sm))),
      padding: const MaterialStatePropertyAll(
          EdgeInsets.all(DimeUtil.sm)),
      backgroundColor:
      const MaterialStatePropertyAll(ColorsUtil.primaryColor),
    );
  }
}