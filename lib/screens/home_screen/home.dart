import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:money_trail/screens/home_screen/widgets/indicator.dart';
import 'package:money_trail/screens/home_screen/widgets/trail_card.dart';
import 'package:money_trail/screens/home_screen/widgets/transaction.dart';
import 'package:money_trail/screens/main_controller.dart';
import 'package:money_trail/utils/constant/colors.dart';
import 'package:money_trail/utils/constant/image_path.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/constant/strings_constant.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

import '../../api/google_mail.dart';
import '../../model/model_transaction.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    mainController.onInit();

    return Container(
      margin: const EdgeInsets.all(DimeUtil.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TrailCard(),
          // ElevatedButton(onPressed: (){
          //   EmailExtractor().extractEmail();
          // }, child: const Text('Hello')),
          // SizedBox(
          //   width: double.infinity,
          //   child: Row(
          //   children: [
          //     Indicator(
          //       title: StringConstant.INCOME,
          //       percentage: 30,
          //       color: Colors.teal[800],
          //     ),
          //     Indicator(
          //       title: StringConstant.INVESTMENT,
          //       percentage: 10,
          //       color: Colors.teal[50],
          //     ),
          //     // Indicator(
          //     //   title: StringConstant.EXPENSES,
          //     //   percentage: 60,
          //     //   color: Colors.grey[200],
          //     // ),
          //   ],
          //   ),
          // ),

          // Column(
          //   children: [
          //     Container(
          //       margin: const EdgeInsets.all(1.0),
          //       width: 30.0,
          //       height: 10.0,
          //       decoration: BoxDecoration(
          //           color: Colors.yellow,
          //           borderRadius: BorderRadius.circular(15.0),
          //           border: Border.all(color: Colors.black)
          //       ),
          //     ),
          //     Container(
          //       margin: const EdgeInsets.all(1.0),
          //       width: 30.0,
          //       height: 10.0,
          //       decoration: BoxDecoration(
          //           color: Colors.yellow,
          //           borderRadius: BorderRadius.circular(15.0),
          //           border: Border.all(color: Colors.black)
          //       ),
          //     ),
          //     Container(
          //       margin: const EdgeInsets.all(1.0),
          //       width: 30.0,
          //       height: 10.0,
          //       decoration: BoxDecoration(
          //           color: Colors.yellow,
          //           borderRadius: BorderRadius.circular(15.0),
          //           border: Border.all(color: Colors.black)
          //       ),
          //     ),
          //     Container(
          //       margin: const EdgeInsets.all(1.0),
          //       width: 30.0,
          //       height: 10.0,
          //       decoration: BoxDecoration(
          //           color: Colors.yellow,
          //           borderRadius: BorderRadius.circular(15.0),
          //           border: Border.all(color: Colors.black)
          //       ),
          //     ),
          //
          //   ],
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: DimeUtil.lg),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  StringConstant.TRANSACTION,
                  style: StringUtilsStyle.getHeadingThree(),
                ),
                Text(
                  StringConstant.SEE_ALL,
                  style: StringUtilsStyle.getHeadingSix(),
                ),
              ],
            ),
          ),
          // Obx(
          //   ()=> Expanded(
          //       child: ListView.builder(
          //     itemBuilder: (context, index) => Transaction(transaction: mainController.transactions[index],),
          //     itemCount: mainController.transactions.length,
          //     scrollDirection: Axis.vertical,
          //   )),
          // )
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: DimeUtil.xs),
                child: Row(
                  children: [
                    Transform.rotate(angle:-0.8, child:Image.asset(ImagePath.IMAGE_TRAIL, color: Colors.black,width: 45.0, height: 45.0,)),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Shopping",  style: StringUtilsStyle.getHeadingFive(), ),
                              Text("Cash", style: StringUtilsStyle.getHeadingSeven(),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Rs 10,000", style: StringUtilsStyle.getHeadingFour(color: Colors.redAccent),),
                              Text("3 Feb, 2024"),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: DimeUtil.xl),
                                    child: Text("128,996", style: StringUtilsStyle.getHeadingNine(),),
                                  ),
                                  Text("127,996", style: StringUtilsStyle.getHeadingNine(color: Colors.redAccent),),
                                ],
                              )
                            ],
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: DimeUtil.xs),
                child: Row(
                  children: [
                    Transform.rotate(angle:-0.8, child:Image.asset(ImagePath.IMAGE_TRAIL, color: Colors.black,width: 45.0, height: 45.0,)),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Salary",  style: StringUtilsStyle.getHeadingFive(), ),
                              Text("Bank", style: StringUtilsStyle.getHeadingSeven(),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Rs 128,996", style: StringUtilsStyle.getHeadingFour(color: Colors.teal),),
                              Text("2 Feb, 2024"),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: DimeUtil.xl),
                                    child: Text("96", style: StringUtilsStyle.getHeadingNine(),),
                                  ),
                                  Text("128,996", style: StringUtilsStyle.getHeadingNine(color: Colors.teal),),
                                ],
                              )
                            ],
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
        
      ),
    );
  }
}
