import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  final auth = FirebaseAuth.instance;
  // GoogleSignin instance create
  final googleSignin = GoogleSignIn();

  // Method to sign in using googl
  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignin
          .signIn();

      // Check if the user cancelled the sign in
      if (googleSignInAccount == null) {
        return false; // User cancelled
      }

      // Get the authentication token
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      // Firebase credentials creation using the token from google
      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      // Sign in to firebase using the google credentials

      await auth.signInWithCredential(authCredential);
      return true; // Sign-in successful
    } on FirebaseAuthException catch (e) {
      print(e.toString()); // Error Occured
      return false;
      // thorws e
    }
  }

  // Method to sign out from both firebase and  google
  googleSignOut() async {
    // sign out from firebase
    await auth.signOut();
    // sign out from google
    await googleSignin.signOut();
  }
}
