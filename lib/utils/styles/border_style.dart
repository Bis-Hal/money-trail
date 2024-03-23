import 'package:flutter/material.dart';
import 'package:money_trail/utils/constant/dime.dart';

class BorderUtilStyle{
  static  OutlineInputBorder getFocusBorderStyle(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(DimeUtil.borderRadius),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5
        ));
  }

  static  OutlineInputBorder getBorderStyle(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(DimeUtil.borderRadius),
        borderSide: const BorderSide(
          color: Colors.green,
          width: 1.5
        ));
  }
}