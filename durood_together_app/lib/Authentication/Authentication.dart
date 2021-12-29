import 'package:durood_together_app/Core/DataModels/UserModel/user-model.dart';
import 'package:durood_together_app/Core/DataViewModels/UserViewModel/user-view-model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as fb;
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  final auth.FirebaseAuth _firebaseAuth;

  Authentication(this._firebaseAuth);

  Stream<auth.User> get authStateChanges => _firebaseAuth.authStateChanges();

  // SignIn Function
  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Signed In Successfully.';
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
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
    } on auth.FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Password Reset Function
  Future<String> sendResetPasswordEmail({String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);

      // print('Signing Up User');
      return 'Email Sent Successfully.';
    } on auth.FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // SingnOut Function
  Future<String> signOut() async {
    try {
      print(_firebaseAuth.currentUser.providerData.elementAt(0).providerId);
      if (_firebaseAuth.currentUser.providerData.elementAt(0).providerId ==
          'google.com') {
        await GoogleSignIn().signOut();
        await _firebaseAuth.signOut();
        return 'Signed Out Successfully.';
      } else if (_firebaseAuth.currentUser.providerData
              .elementAt(0)
              .providerId ==
          'facebook.com') {
        await fb.FacebookAuth.instance.logOut();
        await _firebaseAuth.signOut();
        return 'Signed Out Successfully.';
      } else {
        await _firebaseAuth.signOut();
        return 'Signed Out Successfully.';
      }
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String> signInWithGoogle({String country, String city}) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      // print(googleUser);

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser?.authentication;

      // print(googleAuth);

      if (googleAuth != null) {
        // Create a new credential
        final credential = auth.GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        // print(credential);

        // Once signed in, return the UserCredential
        auth.UserCredential returned_credential =
            await _firebaseAuth.signInWithCredential(credential);

        UserModel data = new UserModel(
          Country: country,
          City: city,
          Email: returned_credential.user.email,
          Name: returned_credential.user.displayName,
        );

        UserViewModel().addCustomUser(data, returned_credential.user.uid);

        // print('Google Sign in.');
        print(returned_credential);
        return 'Signed in Successful';
      } else {
        return 'Sign in Cancelled';
      }
    } on auth.FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Facebook Login
  Future<String> signInWithFacebook({String country, String city}) async {
    try {
      // Trigger the sign-in flow
      final fb.LoginResult loginResult = await fb.FacebookAuth.instance.login();

// Create a credential from the access token
      final auth.OAuthCredential facebookAuthCredential =
          auth.FacebookAuthProvider.credential(loginResult.accessToken.token);
// print(credential);

// Once signed in, return the UserCredential
      auth.UserCredential returned_credential =
          await _firebaseAuth.signInWithCredential(facebookAuthCredential);

      UserModel data = new UserModel(
        Country: country,
        City: city,
        Email: returned_credential.user.email,
        Name: returned_credential.user.displayName,
      );

      UserViewModel().addCustomUser(data, returned_credential.user.uid);

// print('Google Sign in.');
      print(returned_credential);
      return 'Signed in Successful';
    } on auth.FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
