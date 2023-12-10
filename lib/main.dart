import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_trail/screens/expense_screen/add_expense.dart';
import 'package:money_trail/screens/budget_planer_screen/budget_planer.dart';
import 'package:money_trail/screens/home_screen/home.dart';
import 'package:money_trail/screens/transaction_screen/Transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  final screens = [
    Home(),
    AddExpense(),
    Transactions()
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(child:screens[currentIndex]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
        backgroundColor: Colors.red,
        child: const FaIcon(FontAwesomeIcons.add, color: Colors.white,),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              setState(() {
                currentIndex = index;
              });

            },
          items:  [
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.house, color: Colors.green,),label: "Home"),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.house, color: Colors.green),label: "Home",),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.house, color: Colors.green),label: "Home",),
          ],
        ),
      )
    );
  }
}



