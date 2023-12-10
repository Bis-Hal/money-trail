import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:money_trail/utils/constant/font_constant.dart';

class StringUtilsStyle{

  static TextStyle getHeadingOne({color = Colors.black,size = 32.0}){
    return TextStyle(
      color: color,
      fontFamily: Font.bold,
      fontSize: size
    );
  }
  static TextStyle getHeadingTwo({color = Colors.black,size = 28.0}){
    return TextStyle(
        color: color,
        fontFamily: Font.bold,
        fontSize: size
    );
  }
  static TextStyle getHeadingThree({color = Colors.black,size = 24.0}){
    return TextStyle(
        color: color,
        fontFamily: Font.bold,
        fontSize: size
    );
  }
  static TextStyle getHeadingFour({color = Colors.black,size = 20.0}){
    return TextStyle(
        color: color,
        fontFamily: Font.semiBold,
        fontSize: size
    );
  }
  static TextStyle getHeadingFive({color = Colors.black,size = 18.0}){
    return TextStyle(
        color: color,
        fontFamily: Font.semiBold,
        fontSize: size
    );
  }
  static TextStyle getHeadingSix({color = Colors.black,size = 16.0}){
    return TextStyle(
        color: color,
        fontFamily: Font.semiBold,
        fontSize: size
    );
  }
  static TextStyle getHeadingSeven({color = Colors.black,size = 14.0}){
    return TextStyle(
        color: color,
        fontFamily: Font.regular,
        fontSize: size
    );
  }
  static TextStyle getHeadingEight({color = Colors.black,size = 12.0}){
    return TextStyle(
        color: color,
        fontFamily: Font.regular,
        fontSize: size
    );
  }
  static TextStyle getHeadingNine({color = Colors.black,size = 11.0}){
    return TextStyle(
        color: color,
        fontFamily: Font.regular,
        fontSize: size
    );
  }
  static TextStyle getCustomStyle({color ,size, fontFamily}){
    return TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: size
    );
  }
}