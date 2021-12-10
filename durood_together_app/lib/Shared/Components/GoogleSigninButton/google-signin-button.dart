import 'package:durood_together_app/Authentication/Authentication.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/HomeScreen/SnackBar/custom-snackbar.dart';
import 'package:durood_together_app/Services/LocationService/location_service.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class GoogleSigninButton extends StatefulWidget {
  GoogleSigninButton({Key key}) : super(key: key);

  @override
  State<GoogleSigninButton> createState() => _GoogleSigninButtonState();
}

class _GoogleSigninButtonState extends State<GoogleSigninButton> {
  bool isGooglePressed = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    String googleResult;
    String country;
    String city;

    return ElevatedButton(
      onPressed: () async {
        // setState(() {
        //   this.isGooglePressed = true;
        // });
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

        print('Google Result');
        print(googleResult);

        if (googleResult == 'Signed in Successful') {
          final snackBar = SnackBar(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 30.0,
            ),
            backgroundColor:
                Constant.app_primary_contrast_color.withOpacity(0.7),
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
            backgroundColor:
                Constant.app_primary_contrast_color.withOpacity(0.7),
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
            !this.isGooglePressed
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: Text(
                      'Google',
                      style: TextStyle(
                        fontSize: Constant.app_button_font_size,
                        fontWeight: Constant.app_font_weight,
                        letterSpacing: Constant.app_normal_letter_spacing,
                        // color: Constant.app_primary_color,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: CircularProgressIndicator(
                      color: Constant.app_primary_contrast_color,
                    ),
                  ),
          ],
        ),
      ),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
            Constant.app_primary_contrast_color),
        backgroundColor: MaterialStateProperty.all<Color>(
          Constant.app_primary_color,
        ),
        // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        //   EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
        // ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(Constant.app_button_border_radius),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(Constant.app_button_min_width, Constant.app_button_height),
        ),
        maximumSize: MaterialStateProperty.all<Size>(
          Size(Constant.app_button_max_width, Constant.app_button_height),
        ),
      ),
    );
  }
}
