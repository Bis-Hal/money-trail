import 'package:flutter/material.dart';
import 'package:money_trail/utils/dime.dart';
import 'package:money_trail/utils/strings.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(sm),
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: double.infinity,
        height: 150.0,
        padding: const EdgeInsets.all(sm),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/money.png"),
            fit: BoxFit.contain,
              alignment: Alignment.bottomRight
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$rs 73,000", style: TextStyle(
                    fontFamily: "Titillium Web Bold",
                    fontSize: 32.0
                ),),
                Text(balance, style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "Titillium Web SemiBold"
                ),),
              ],
            ),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.ac_unit_sharp),
                  Text("Transation"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

