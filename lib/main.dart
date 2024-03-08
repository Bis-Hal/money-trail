import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:googleapis/admob/v1.dart';
import 'package:money_trail/init_controller.dart';
import 'package:money_trail/screens/expense_screen/add_expense.dart';
import 'package:money_trail/screens/home_screen/home.dart';
import 'package:money_trail/screens/main_controller.dart';
import 'package:money_trail/screens/sign_in/sign_in.dart';
import 'package:money_trail/screens/transaction_screen/Transactions.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/constant/image_path.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final screens = [
    const Home(),
    Transactions(),
    const AddExpense(),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    return GetMaterialApp(
        initialBinding: InitController(),
        debugShowCheckedModeBanner: false,
        home: Obx(()=>mainController.isLoggedIn
            ? Obx(
                () => Scaffold(
                  appBar: AppBar(
                    elevation: 0.0,
                    title: Text("FloWallet", style: StringUtilsStyle.getHeadingFive(),),
                    actions: [
                      CircleAvatar(
                        radius: 50.0,
                        child: Image.asset(ImagePath.IMAGE_LOGO),
                      )
                    ],
                  ),
                  body: SafeArea(
                      child: screens[mainController.currentIndex]),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      Get.to(() => AddExpense());
                    },
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(DimeUtil.borderFullCircle)
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.add,
                      color: Colors.white,
                    ),
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  bottomNavigationBar: BottomNavigationBar(
                    currentIndex: mainController.currentIndex,
                    type: BottomNavigationBarType.fixed,
                    selectedLabelStyle: StringUtilsStyle.getHeadingFive(),
                    selectedItemColor: Colors.teal,
                    unselectedLabelStyle: StringUtilsStyle.getHeadingSix(),
                    unselectedItemColor: Colors.grey[600],
                    onTap: (index) {
                      mainController.setCurrentIndex(index);
                    },
                    items: const [
                      BottomNavigationBarItem(
                        icon: FaIcon(
                          FontAwesomeIcons.house,
                        ),
                        label: "Home",
                      ),
                      BottomNavigationBarItem(
                        icon: FaIcon(
                          FontAwesomeIcons.wallet,
                        ),
                        label: "Wallet",
                      ),
                    ],
                  ),
                ),
              )
            : SignIn()));
  }
}
