import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/gmail/v1.dart';
import 'package:intl/intl.dart';
import 'package:money_trail/model/credited.dart';
import 'package:money_trail/screens/main_controller.dart';

import 'google_auth_client.dart';

class EmailExtractor {
  static const List<String> scopes = <String>[
    // 'https://www.googleapis.com/auth/contacts.readonly',
    GmailApi.gmailReadonlyScope,
  ];

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: scopes,
  );


  List<Credited> debits = [];

  Future<void> extractEmail() async {
    MainController mainController = Get.put(MainController());
    try {
      final account = await _googleSignIn.signIn();
      var authClientHeader = await account?.authHeaders;
      final client = GoogleAuthClient(authClientHeader!);
      final mail = GmailApi(client);
      var messages = await mail.users.messages.list("me", q: "from:borntobeplayer7@gmail.com after:2024/03/15");
      // var messages = await mail.users.messages.list("me", q: "globalsmartplus@gibl.com.np");
      for (var message in messages.messages!) {
        var messageBody = await mail.users.messages.get("me", message.id!);

        var parts = messageBody.payload!.parts;
        if (parts != null && parts.isNotEmpty) {
          for (var part in parts) {
            if (part.mimeType == "text/plain") {
              print("YESS");
              var decodedData = base64Url.decode(part.body!.data!);
              var body = String.fromCharCodes(decodedData);
              if(isCreditTransaction(body)){
                  mainController.credits.add(getCreditedTransaction(body));
              }
              // if(isDebitTransaction(body)){
              //   mainController.credits.add(getCreditedTransaction(body));
              //
              // }
            }
          }
        }
      }
    } catch (e) {
      print("Sign In Failed $e");
    }
  }

  Credited getCreditedTransaction(String body) {
    String line = body;
    List<String> words = line.split(" ");
    print(words);
    print(words[8]);
    print(words[10]);
    print(words[11]);
    return Credited(double.parse(words[8]), DateTime.now(), "", "");
  }
  Credited getDebitedTransaction(String body) {
    String line = body;
    List<String> words = line.split(" ");
    return Credited(double.parse(words[8]), DateFormat("dd MM, yy HH:mm:ss").parse(words[10] + words[11]), "", "");
  }

  bool isCreditTransaction(String body) {
    return body.contains("Credited by NPR");
  }

  // bool isDebitTransaction(String body) {
  //   return body.contains("Debited by NPR");
  // }
}
