import 'package:durood_together_app/Core/DataModels/UserModel/user-model.dart';
import 'package:durood_together_app/Core/DataViewModels/UserViewModel/user-view-model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  final FirebaseAuth _firebaseAuth;

  Authentication(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  // SignIn Function
  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Signed In Successfully.';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // SignUp Function
  Future<String> signUp(
      {String email, String password, String country, String city}) async {
    try {
      dynamic result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      dynamic user = result.user;

      print('Signing Up User');
      print(user.uid);

      UserModel data = new UserModel(
          Country: country,
          City: city,
          Email: user.email,
          Name: user.displayName);

      UserViewModel().addCustomUser(data, user.uid);

      return 'SignedUp Successfully.';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // SingnOut Function
  Future<String> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return 'Signed Out Successfully.';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<UserCredential> signInWithGoogle({String country, String city}) async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // print(googleUser);

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser?.authentication;

    // print(googleAuth);

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // print(credential);

    // Once signed in, return the UserCredential
    UserCredential returned_credential =
        await _firebaseAuth.signInWithCredential(credential);

    UserModel data = new UserModel(
      Country: country,
      City: city,
      Email: returned_credential.user.email,
      Name: returned_credential.user.displayName,
    );

    UserViewModel().addCustomUser(data, returned_credential.user.uid);

    // print('Google Sign in.');
    // print(returned_credential);
    return returned_credential;
  }
}
