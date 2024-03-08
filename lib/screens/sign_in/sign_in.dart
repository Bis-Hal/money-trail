import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:money_trail/database/collections.dart';
import 'package:money_trail/database/firebase_config.dart';
import 'package:money_trail/screens/sign_in/sign_in_controller.dart';
import 'package:money_trail/screens/sign_up/sign_up.dart';
import 'package:money_trail/utils/constant/colors.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/constant/image_path.dart';
import 'package:money_trail/utils/styles/text_editor_style.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

import '../main_controller.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final TextEditingController _password = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  SignInController signInController = Get.put(SignInController());
  MainController mainController = Get.put(MainController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(DimeUtil.xl),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  ImagePath.IMAGE_LOGO,
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  alignment: Alignment.topRight,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Stacking",
                        style: StringUtilsStyle.getHeadingThree(),
                      ),
                      Text(
                        "bills for the sole",
                        style: StringUtilsStyle.getHeadingSeven(),
                      ),
                      Text(
                        "purpose of chasing thrills",
                        style: StringUtilsStyle.getHeadingSeven(),
                      ),
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
                                height: 60.0,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Field Cannot be empty";
                                    }
                                  },
                                  decoration: TextEditorStyle(
                                          label: "Username",
                                          prefixIcon: FontAwesomeIcons.userSecret)
                                      .getInputDecorator(),
                                  controller: _phoneNumber,
                                  style: StringUtilsStyle.getHeadingFive(
                                      color: ColorsUtil.baseBlackColor),
                                ),
                              ),
                              Obx(
                                () => SizedBox(
                                  height: 60.0,
                                  child: TextFormField(
                                    obscureText: signInController.isObstruct,
                                    decoration: TextEditorStyle (
                                            label: "Password",
                                            prefixIcon: FontAwesomeIcons.keybase,
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
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: ColorsUtil.primaryColor,
                            height: 1.0,
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal:   15.0),
                            child: Text("or continue with", style: StringUtilsStyle.getHeadingSeven(),)),
                        Expanded(
                          child: Container(
                            color: ColorsUtil.primaryColor,
                            height: 1.0,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(DimeUtil.lg),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            elevation: DimeUtil.elevationSm,
                            color: ColorsUtil.baseWhiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(DimeUtil.borderFullCircle),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(DimeUtil.md),
                              child: const FaIcon(FontAwesomeIcons.google),
                            ),
                          )
                        ],
                      ),
                    )

                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forget Password",
                          style: StringUtilsStyle.getHeadingSeven(),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: DimeUtil.md),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Firebase.auth.signInWithEmailAndPassword(
                            //     email: "bishalmaharjan17@gmail.com",
                            //     password: _password.text);
                            FirebaseCollections("Bishal");
                            mainController.setLoggedIn();
                          } else {
                            print("Not Valid");
                          }
                        },
                        style: ButtonStyle(
                          mouseCursor: const MaterialStatePropertyAll(
                              MouseCursor.uncontrolled),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(DimeUtil.sm))),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(DimeUtil.sm)),
                          backgroundColor:
                              const MaterialStatePropertyAll(ColorsUtil.primaryColor),
                        ),
                        child: Text(
                          "SIGN IN",
                          style: StringUtilsStyle.getHeadingFive(
                              color: ColorsUtil.baseWhiteColor),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don\'t have an account ",
                          style: StringUtilsStyle.getHeadingSeven(),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_phoneNumber.text.isNotEmpty) {}
                            Get.to(() => const SignUp());
                          },
                          child: Text(
                            "Sign Up",
                            style: StringUtilsStyle.getHeadingSeven(
                                color: ColorsUtil.baseGreyColor),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
