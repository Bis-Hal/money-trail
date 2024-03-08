import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:money_trail/screens/sign_in/sign_in.dart';
import 'package:money_trail/screens/sign_in/widgets/input_field.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/constant/image_path.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(DimeUtil.xl),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: MediaQuery.sizeOf(context).height * 0.4,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image:AssetImage(ImagePath.IMAGE_FINANCE_DATA),
                        fit: BoxFit.fitHeight
                      )
                    ),
                    child: Text("Sign Up", style: StringUtilsStyle.getHeadingOne(), textAlign: TextAlign.left,)),

                SizedBox(
                    height: 60.0,
                    child: InputField(label: "Username", icon: FontAwesomeIcons.userSecret,)),
               SizedBox(
                      height: 60.0,
                      child: InputField(label: "Password", icon: FontAwesomeIcons.keybase, isObstructTextEnable: true,)),
                SizedBox(
                    height: 60.0,
                    child: InputField(label: "Employed", icon: FontAwesomeIcons.briefcase,)),
                Column(
                  children: [
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: DimeUtil.md),
                        child: ElevatedButton(onPressed: (){}, style: ButtonStyle(
                          mouseCursor: const MaterialStatePropertyAll(
                              MouseCursor.uncontrolled),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(DimeUtil.sm))),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(DimeUtil.sm)),
                          backgroundColor:
                          const MaterialStatePropertyAll(Colors.green),
                        ), child: Text("SIGN UP", style: StringUtilsStyle.getHeadingFive(color: Colors.white),),)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account ",
                          style: StringUtilsStyle.getHeadingSeven(),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(()=>SignIn());
                          },
                          child: Text(
                            "Sign In",
                            style: StringUtilsStyle.getHeadingSeven(
                                color: Colors.grey[700]),
                          ),
                        )
                      ],
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
