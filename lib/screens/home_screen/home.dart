import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_trail/database/local/transaction/transaction_database.dart';
import 'package:money_trail/database/local/transaction/transaction_entity.dart';
import 'package:money_trail/model/credited.dart';
import 'package:money_trail/screens/home_screen/widgets/indicator.dart';
import 'package:money_trail/screens/home_screen/widgets/trail_card.dart';
import 'package:money_trail/screens/main_controller.dart';
import 'package:money_trail/services/google_mail.dart';
import 'package:money_trail/services/google_services_util.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/constant/strings_constant.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

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
          TrailCard(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Indicator(title: "Clothes", icon: "assets/clothes.png"),
                Indicator(title: "Food", icon: "assets/food.png"),
                Indicator(title: "stationary", icon: "assets/stationary.png"),
                Indicator(title: "Pathao Food", icon: "assets/pathao.png"),
                Indicator(title: "Transportation", icon: "assets/bus.png"),
                Indicator(title: "Mart", icon: "assets/mart.png"),

              ],
            ),
          ),
          // ElevatedButton(onPressed: () async {
          //   final database = await $FloorTransactionDataBase.databaseBuilder('app_database_db').build();
          //   final transactionDao = database.transactionDAO;
          //   final transaction = TransactionEntity(remarks: "Pizza", category: 1, type: "FOOD");
          //   await transactionDao.setTransaction(transaction);
          //   final result = await transactionDao.findAllTransaction();
          //   for (var value in result) {
          //     print(value.toString());
          //   }
          //
          // }, child: Text("Add")),
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
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index)=>Container(
                  margin: const EdgeInsets.symmetric(vertical: DimeUtil.sm),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(DimeUtil.xl)
                            ),
                            width: 4.0,
                            height: 60.0,
                            margin: const EdgeInsets.only(right:DimeUtil.md),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Shopping",  style: StringUtilsStyle.getHeadingFive(), ),
                              Text("Cash", style: StringUtilsStyle.getHeadingSeven(),),
                            ],
                          ),
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
                )),
          )

        ],
        
      ),
    );
  }
}
