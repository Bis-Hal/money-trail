import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:money_trail/global_widgets/nav_bar_item.dart';
import 'package:money_trail/global_widgets/notification_bell.dart';
import 'package:money_trail/global_widgets/top_nav_bar.dart';
import 'package:money_trail/init_controller.dart';
import 'package:money_trail/screens/expense_screen/manual_trail_manager.dart';
import 'package:money_trail/screens/home_screen/home.dart';
import 'package:money_trail/screens/main_controller.dart';
import 'package:money_trail/screens/profile/profile.dart';
import 'package:money_trail/screens/sign_in/sign_in.dart';
import 'package:money_trail/utils/constant/colors.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/constant/font_constant.dart';
import 'package:money_trail/utils/constant/strings_constant.dart';
import 'package:money_trail/utils/styles/text_styles.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  MainController mainController = Get.put(MainController());


  final screens = [
    const Home(),
    const Home(),
    const ManualTrailManager(),
    // Profile()
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: InitController(),
        debugShowCheckedModeBanner: false,
        home: Obx(() => mainController.isLoggedIn
            ? Obx(
                () => Scaffold(
                  appBar:AppBar(
                    elevation: 0.0,
                    title: Text(
                      "Money trail",
                      style: StringUtilsStyle.getHeadingFive(),
                    ),
                    actions:   [
                      const NotificationBell(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: DimeUtil.md),
                        child: ClipOval(
                          child: Image.network(
                            MainController.photoUrl,
                            width: 30.0,
                            height: 30.0,
                          ),
                        ),
                      ),

                    ],
                  ),
                  body: SafeArea(child: screens[mainController.currentIndex]),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      Get.to(() => const ManualTrailManager());
                    },
                    backgroundColor: ColorsUtil.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(DimeUtil.borderFullCircle)),
                    child: const FaIcon(
                      FontAwesomeIcons.add,
                      color: Colors.white,
                    ),
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  bottomNavigationBar: BottomAppBar(
                    surfaceTintColor: Colors.white,
                    // color: Colors.green,
                    padding: const EdgeInsets.all(0.0),
                    height: 62.0,
                    shape: const CircularNotchedRectangle(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NavBarItem(
                            index: 0,
                            label: StringConstant.HOME,
                            iconData: Icons.home),
                        NavBarItem(
                            index: 1,
                            label: StringConstant.TRANSACTIONS,
                            iconData: Icons.book_rounded),
                      ],
                    ),
                  ),
                ),
              )
            : SignIn()));
  }

  }

