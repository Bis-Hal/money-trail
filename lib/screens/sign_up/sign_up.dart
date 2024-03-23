import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:money_trail/screens/main_controller.dart';
import 'package:money_trail/screens/sign_in/sign_in.dart';
import 'package:money_trail/screens/sign_in/sign_in_controller.dart';
import 'package:money_trail/screens/sign_in/widgets/input_field.dart';
import 'package:money_trail/services/google_services_util.dart';
import 'package:money_trail/utils/constant/colors.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/constant/image_path.dart';
import 'package:money_trail/utils/constant/strings_constant.dart';
import 'package:money_trail/utils/styles/text_editor_style.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final TextEditingController _password = TextEditingController();
  final TextEditingController _username = TextEditingController();
  SignInController signInController = Get.put(SignInController());
  MainController mainController = Get.put(MainController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(DimeUtil.xl),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Text(StringConstant.SIGN_UP, style: StringUtilsStyle.getCustomStyle(size: 64.0), textAlign: TextAlign.start,)),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: DimeUtil.xl4),
                    child: Column(
                      children: [
                        Container(
                          margin:
                          const EdgeInsets.only(bottom: DimeUtil.sm),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Field Cannot be empty";
                              }
                            },
                            decoration: TextEditorStyle(
                              label: StringConstant.USERNAME,)
                                .getInputDecorator(),
                            controller: _username,
                            style: StringUtilsStyle.getHeadingFive(
                                color: ColorsUtil.baseBlackColor),
                          ),
                        ),
                        Container(
                          margin:
                          const EdgeInsets.only(bottom: DimeUtil.sm),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Field Cannot be empty";
                              }
                            },
                            decoration: TextEditorStyle(
                              label: StringConstant.Email,)
                                .getInputDecorator(),
                            controller: _username,
                            style: StringUtilsStyle.getHeadingFive(
                                color: ColorsUtil.baseBlackColor),
                          ),
                        ),
                        Obx(
                              () => SizedBox(
                            child: TextFormField(
                              obscureText: signInController.isObstruct,
                              decoration: TextEditorStyle (
                                  label: StringConstant.PASSWORD,
                                  isObstructTextEnable: true)
                                  .getInputDecorator(),
                              controller: _password,
                              style: StringUtilsStyle.getHeadingFive(
                                  color: ColorsUtil.baseBlackColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: DimeUtil.md),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric( vertical : DimeUtil.md),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: ColorsUtil.primaryColor,
                                height: 1.5,
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.symmetric(horizontal: DimeUtil.md),
                                child: Text(StringConstant.CONTINUE_WITH, style: StringUtilsStyle.getHeadingSeven(),)),
                            Expanded(
                              child: Container(
                                color: ColorsUtil.primaryColor,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(DimeUtil.md),
                            border: Border.all(color: ColorsUtil.baseBlackColor)
                        ),
                        padding: const EdgeInsets.all(DimeUtil.lg),
                        child: GestureDetector(
                          onTap: (){
                            GoogleServices().signInWithGoogle().then((value) => {
                              if (value){
                                mainController.setLoggedIn()
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(ImagePath.IMAGE_GOOGLE_LOGO, width: 24.0, height: 24.0,),
                              Padding(
                                padding: const EdgeInsets.only(left: DimeUtil.xl),
                                child: Text(StringConstant.CONTINUE_WITH_GOOGLE, style: StringUtilsStyle.getHeadingSeven(),),
                              )
                            ],
                          ),
                        ),
                      )

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: DimeUtil.md),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            StringConstant.FORGET_PASSWORD,
                            style: StringUtilsStyle.getHeadingSeven(),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: DimeUtil.xs),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              mainController.setLoggedIn();
                            }
                          },
                          style: ButtonStyle(
                            mouseCursor: const MaterialStatePropertyAll(
                                MouseCursor.uncontrolled),
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(DimeUtil.sm))),
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.all(DimeUtil.lg)),
                            backgroundColor:
                            const MaterialStatePropertyAll(ColorsUtil.primaryColor),
                          ),
                          child: Text(
                            StringConstant.SIGN_IN,
                            style: StringUtilsStyle.getHeadingFive(
                                color: ColorsUtil.baseWhiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      StringConstant.SIGN_UP_QUESTION,
                      style: StringUtilsStyle.getHeadingSeven(),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SignIn());
                      },
                      child: Text(
                        StringConstant.SIGN_IN,
                        style: StringUtilsStyle.getHeadingSix(
                            color: ColorsUtil.primaryColor),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
