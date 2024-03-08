import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:money_trail/screens/sign_in/sign_in_controller.dart';
import 'package:money_trail/utils/styles/text_editor_style.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final SignInController signInController = Get.put(SignInController());
  String label;
  IconData? icon;
  bool isObstructTextEnable;

  InputField({super.key, required this.label, this.icon, this.isObstructTextEnable = false,});

  @override
  Widget build(BuildContext context) {

    return Obx(
      ()=> TextField(
        obscureText: signInController.isObstruct,
        decoration: TextEditorStyle(
            label: label,
            prefixIcon: icon,
            isObstructTextEnable: isObstructTextEnable)
            .getInputDecorator(),
        controller: controller,
        style: StringUtilsStyle.getHeadingFive(
            color: Colors.black),
      ),
    );
  }
}
