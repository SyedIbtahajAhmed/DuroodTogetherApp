import 'package:firebase_auth/firebase_auth.dart';

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
  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
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
}
