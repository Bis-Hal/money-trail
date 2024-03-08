import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/gmail/v1.dart';
import 'package:money_trail/api/google_auth_client.dart';

class EmailExtractor {
  static const List<String> scopes = <String>[
    // 'https://www.googleapis.com/auth/contacts.readonly',
    GmailApi.gmailReadonlyScope,
  ];

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: scopes,
  );

  Future<void> extractEmail() async {
    try {
      final account = await _googleSignIn.signIn();
      var authClientHeader = await account?.authHeaders;
      final client = GoogleAuthClient(authClientHeader!);
      print(client.toString());
      final mail = await GmailApi(client);
      var messages = await mail.users.messages.list("me");
      for (var message in messages.messages!) {
        var messageBody = await mail.users.messages.get("me", message.id!);
        var parts = messageBody.payload!.parts;
        if(parts != null && parts.isNotEmpty){
          for(var part in parts){
              if(part.mimeType == "text/plain"){
                var decodedData = base64Url.decode(part.body!.data!);
                var body = String.fromCharCodes(decodedData);
                print(body);
              }
          }
        }


        print(parts);
      }

    } catch (e) {
      print("Sign In Failed $e");
    }

    //
    // var message = await gmailApi.users.messages.list("bishalmahrjan1367@gmail.com");
    // print(message.messages);
  }
}
