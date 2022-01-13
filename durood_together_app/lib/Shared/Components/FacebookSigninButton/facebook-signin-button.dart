import 'package:durood_together_app/Authentication/Authentication.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class FacebookSigninButton extends StatefulWidget {
  const FacebookSigninButton({Key key}) : super(key: key);

  @override
  State<FacebookSigninButton> createState() => _FacebookSigninButtonState();
}

class _FacebookSigninButtonState extends State<FacebookSigninButton> {
  bool isGooglePressed = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    dynamic googleResult;
    String country;
    String city;

    return ElevatedButton(
      onPressed: () async {
        // setState(() {
        //   this.isGooglePressed = true;
        // });
        // country = context.read<LocationService>().userAddress.length > 0
        //     ? context.read<LocationService>().userAddress[0].country.toString()
        //     : '';
        // city = context.read<LocationService>().userAddress.length > 0
        //     ? context.read<LocationService>().userAddress[0].locality.toString()
        //     : '';

        googleResult =
            await context.read<Authentication>().signInWithFacebook();

        print('Facebook Login Successful');

        // print('Google Result');
        // print(googleResult);

        // if (googleResult == 'Signed in Successful') {
        //   final snackBar = SnackBar(
        //     padding: EdgeInsets.symmetric(
        //       horizontal: 10.0,
        //       vertical: 30.0,
        //     ),
        //     backgroundColor:
        //         Constant.app_primary_contrast_color.withOpacity(0.7),
        //     content: CustomSnackbar(
        //       text: 'Signed In Successful',
        //     ),
        //   );
        //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // } else {
        //   final snackBar = SnackBar(
        //     padding: EdgeInsets.symmetric(
        //       horizontal: 10.0,
        //       vertical: 30.0,
        //     ),
        //     backgroundColor:
        //         Constant.app_primary_contrast_color.withOpacity(0.7),
        //     content: CustomSnackbar(
        //       text: 'Signed In Unsuccessful',
        //     ),
        //   );
        //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // }
      },
      child: Container(
        width: 25,
        height: 25,
        child: Image(
          image: AssetImage('images/facebook_logo.png'),
        ),
      ),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(10),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue[900]),
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
        // fixedSize: MaterialStateProperty.all<Size>(
        //   Size(Constant.app_button_min_width, Constant.app_button_height),
        // ),
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
