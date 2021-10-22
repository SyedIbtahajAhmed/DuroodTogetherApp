import 'package:durood_together_app/Core/DataModels/UserLocation/user_location.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/homepage.dart';
import 'package:durood_together_app/Screens/Login%20Screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Local Imports

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<UserLocation>(context);
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
