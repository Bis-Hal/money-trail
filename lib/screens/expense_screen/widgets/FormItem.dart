import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../model/model_transaction.dart';
import '../../../utils/constant/dime.dart';
import '../../../utils/styles/border_style.dart';
import '../../../utils/styles/text_styles.dart';


class FormItem extends StatelessWidget {
  FormItem({super.key, this.title, required this.icon, this.hint, required this.modelTransactionObj});
  final hint;
  final title;
  final icon;
  ModelTransaction modelTransactionObj;

  final TextEditingController textEditingController = TextEditingController();
  // AddExpenseController addExpenseController = Get.put(AddExpenseController());

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
              onChanged: (changeContent){
                setTransactionData(title, changeContent);
                print('Rs ${changeContent}');
              },
              controller: textEditingController,
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

  setTransactionData(String key, var value){
    switch(key) {
      case "TITLE" :
        modelTransactionObj.title = value;
        break;
      case "DATE" :
        modelTransactionObj.date = value;
        break;
      case "TYPE" :
        modelTransactionObj.type = value;
        break;
      case "EXTRA01" :
        modelTransactionObj.extra01 = value;
        break;
      case "EXTRA02" :
        modelTransactionObj.extra02 = value;
        break;
      case "EXTRA03" :
        modelTransactionObj.extra03 = value;
        break;
      case "EXTRA04" :
        modelTransactionObj.extra04 = value;
        break;
      case "EXTRA05" :
        modelTransactionObj.extra05 = value;
        break;
      case "SUM" :
        modelTransactionObj.amount = double.parse(value);
        break;
    }
  }
}

