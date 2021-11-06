import 'package:durood_together_app/Authentication/Authentication.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/HomeScreen/SnackBar/custom-snackbar.dart';
import 'package:durood_together_app/Services/LocationService/location_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class GoogleSigninButton extends StatelessWidget {
  const GoogleSigninButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    UserCredential googleResult;
    String country;
    String city;

    return ElevatedButton(
      onPressed: () async {
        country = context.read<LocationService>().userAddress.length > 0
            ? context.read<LocationService>().userAddress[0].country.toString()
            : '';
        city = context.read<LocationService>().userAddress.length > 0
            ? context.read<LocationService>().userAddress[0].locality.toString()
            : '';

        googleResult = await context.read<Authentication>().signInWithGoogle(
              country: country,
              city: city,
            );
        if (googleResult.user != null) {
          final snackBar = SnackBar(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 30.0,
            ),
            backgroundColor: Colors.teal[900].withOpacity(0.7),
            content: CustomSnackbar(
              text: 'Signed In Successful',
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          final snackBar = SnackBar(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 30.0,
            ),
            backgroundColor: Colors.teal[900].withOpacity(0.7),
            content: CustomSnackbar(
              text: 'Signed In Unsuccessful',
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image Container
            Container(
              width: 40,
              height: 40,
              child: Image(
                image: AssetImage('images/google_logo.png'),
              ),
            ),
            // Button Text
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Google',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  letterSpacing: screenSize.width * 0.01,
                  // color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.teal[900]),
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.white,
        ),
        // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        //   EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
        // ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(250, 60),
        ),
        maximumSize: MaterialStateProperty.all<Size>(
          Size(300, 60),
        ),
      ),
    );
  }
}
