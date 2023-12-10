import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/styles/boder_style.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

class FormItem extends StatelessWidget {
  const FormItem({Key? key, this.title, required this.icon, this.hint}) : super(key: key);
  final hint;
  final title;
  final icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(DimeUtil.sm),
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: StringUtilsStyle.getHeadingSix()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: DimeUtil.sm),
            child: TextField(
                decoration: InputDecoration(
                    focusedBorder: BorderUtilStyle.getFocusBorderStyle(),
                    border: BorderUtilStyle.getBorderStyle(),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(DimeUtil.sm),
                      child: FaIcon(icon, color: Colors.red,),
                    ),
                    hintText: hint,
                    hintStyle: StringUtilsStyle.getHeadingSeven())),
          )
        ],
      ),
    );
  }
}
