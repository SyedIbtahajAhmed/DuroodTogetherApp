import 'dart:async';

import 'package:durood_together_app/Authentication/Authentication%20Wrapper/AuthenticationWrapper.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Timer For Splash Screen
    // Timer(
    //     Duration(
    //       milliseconds: 3000,
    //     ), () {
    //   Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (_) => AuthenticationWrapper()));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.app_primary_color,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
// Image Container
            Center(
              child: Container(
                width: 300,
                height: 300,
                child: Image(
                  image: AssetImage('images/logo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 150.0,
              ),
              child: Column(
                children: [
                  Text(
                    "Be a part of the barakah",
                    style: TextStyle(
                      color: Constant.app_primary_contrast_color,
                      fontSize: Constant.h2,
                      fontWeight: Constant.app_font_weight,
                      letterSpacing: Constant.app_normal_letter_spacing,
                    ),
                  ),
                  Text(
                    "cricle of durood shareef",
                    style: TextStyle(
                      color: Constant.app_primary_contrast_color,
                      fontSize: Constant.h3,
                      fontWeight: Constant.app_font_weight,
                      letterSpacing: Constant.app_normal_letter_spacing,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: CircularProgressIndicator(
                color: Constant.app_primary_contrast_color,
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 20.0,
                ),
                child: ElevatedButton(
                  child: Text(
                    "Go To Login Page",
                    style: TextStyle(
                      fontSize: Constant.app_button_font_size,
                      fontWeight: Constant.app_font_weight,
                      letterSpacing: Constant.app_normal_letter_spacing,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => AuthenticationWrapper()));
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Constant.app_primary_color),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Constant.app_primary_contrast_color,
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(10.0),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(Constant.app_button_min_width,
                          Constant.app_button_height),
                    ),
                    maximumSize: MaterialStateProperty.all<Size>(
                      Size(Constant.app_button_max_width,
                          Constant.app_button_height),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          Constant.app_button_border_radius,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
