import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

// Local Imports
import 'package:durood_together_app/HomePage Screen/homepage.dart';
import 'package:durood_together_app/Login Screen/login.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final firebaseUser = context.watch<User>();
    final firebaseUser = Provider.of<User>(context);

    // Checking If User Is Signed In Or Not
    if (firebaseUser != null) {
      // this.firebaseUser.
      return HomePage();
    }

    return Login();
  }
}
