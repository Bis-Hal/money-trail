import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/gmail/v1.dart';
import 'package:money_trail/screens/main_controller.dart';

class GoogleServices{
  static const List<String> scopes = <String>[
    // 'https://www.googleapis.com/auth/contacts.readonly',
    GmailApi.gmailReadonlyScope,
  ];

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: scopes,
  );




  Future<bool> signInWithGoogle() async {

    var isSignedIn = false;
    var googleSignInAccount = await _googleSignIn.signIn();
    if (googleSignInAccount?.authHeaders != null){
      MainController.photoUrl = googleSignInAccount!.photoUrl!;
      MainController.username = googleSignInAccount.displayName!;
      MainController.email = googleSignInAccount.email;
      googleSignInAccount.email;
      isSignedIn = true;
    }
    return isSignedIn;
  }

  googleSignOut(){
    _googleSignIn.signOut();
  }
}