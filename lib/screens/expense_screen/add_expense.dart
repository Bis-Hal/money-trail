import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:money_trail/screens/expense_screen/AddExpenseController.dart';
import 'package:money_trail/screens/expense_screen/widgets/FormItem.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/constant/strings_constant.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    AddExpenseController addExpenseController = Get.put(AddExpenseController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          physics: BouncingScrollPhysics(),
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            margin: const EdgeInsets.all(DimeUtil.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("EXPENSE TRACKER SETTINGS",
                    style: StringUtilsStyle.getHeadingFour()),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: DimeUtil.xl, horizontal: DimeUtil.md),
                        child: Text("Add/Disable expenses",
                            style: StringUtilsStyle.getHeadingSix(
                                color: Colors.grey[700])),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(DimeUtil.md),
                          child: InfiniteCarousel.builder(
                              itemCount: 10,
                              onIndexChanged: (index) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                              itemExtent: 100.0,
                              itemBuilder: (context, itemIndex, realIndex) {
                                return Column(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.utensils,
                                      size: currentIndex == itemIndex ? 64.0 : 32.0,
                                      color: currentIndex == itemIndex
                                          ? Colors.red
                                          : Colors.black,
                                    ),
                                    Text(currentIndex == itemIndex
                                        ? "Resturant Bill"
                                        : "")
                                  ],
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      FormItem(
                          hint: StringConstant.AMOUNT_FORMAT,
                          title: StringConstant.SUM,
                          icon: FontAwesomeIcons.creditCard,
                          modelTransactionObj: addExpenseController.transaction),
                      FormItem(
                        hint: StringConstant.DATE_FORMAT,
                        title: StringConstant.DATE,
                        icon: FontAwesomeIcons.calendar,
                        modelTransactionObj: addExpenseController.transaction,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            addExpenseController.setTransaction();
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  const MaterialStatePropertyAll(Colors.red),
                              padding: const MaterialStatePropertyAll(
                                  EdgeInsets.all(DimeUtil.md)),
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(DimeUtil.borderRadius)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.parachuteBox,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: DimeUtil.md),
                                child: Text(
                                  StringConstant.PAY,
                                  style: StringUtilsStyle.getHeadingThree(
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
