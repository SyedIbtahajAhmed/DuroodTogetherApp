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
    Timer(
        Duration(
          milliseconds: 3000,
        ), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => AuthenticationWrapper()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Constant.app_primary_contrast_color,
      body: Container(
        // color: Constant.app_primary_contrast_color,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [
              0.2,
              1.0,
            ],
            colors: [
              Constant.app_primary_contrast_color,
              Constant.app_primary_contrast_color_light,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image Container
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: screenSize.height / 2 * 0.35),
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Constant.app_primary_color,
                    borderRadius: BorderRadius.all(Radius.circular(250 / 2)),
                  ),
                  child: Image(
                    image: AssetImage('images/islahenafs_logo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),

            Container(
              width: double.infinity,
              height: screenSize.height * 0.45,
              child: Padding(
                padding: EdgeInsets.only(top: screenSize.height * 0.09),
                child: Column(
                  children: [
                    Text(
                      "Uniting Believers",
                      style: TextStyle(
                        color: Constant.app_primary_color,
                        fontSize: 35.0,
                        fontWeight: Constant.app_medium_font_weight,
                        letterSpacing: Constant.app_normal_letter_spacing,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "in Salutation of our Beloved",
                        style: TextStyle(
                          color: Constant.app_primary_color.withOpacity(0.7),
                          fontSize: Constant.h5,
                          fontWeight: Constant.app_font_weight,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Prophet Muhammad (S.A.W)",
                        style: TextStyle(
                          color: Constant.app_primary_color,
                          fontSize: Constant.h3,
                          fontWeight: Constant.app_font_weight,
                          letterSpacing: Constant.app_normal_letter_spacing,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Spacer(),

            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                child: Text(
                  'Powered by AKS iQ',
                  style: TextStyle(
                    fontWeight: Constant.app_font_weight,
                    fontSize: Constant.h6,
                    color: Constant.app_primary_color.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            // Container(
            //   child: CircularProgressIndicator(
            //     color: Constant.app_primary_contrast_color,
            //   ),
            // ),
            // Center(
            //   child: Container(
            //     padding: const EdgeInsets.only(
            //       top: 20.0,
            //     ),
            //     child: ElevatedButton(
            //       child: Text(
            //         "Go To Login Page",
            //         style: TextStyle(
            //           fontSize: Constant.app_button_font_size,
            //           fontWeight: Constant.app_font_weight,
            //           letterSpacing: Constant.app_normal_letter_spacing,
            //         ),
            //       ),
            //       onPressed: () {
            //         Navigator.of(context).pushReplacement(MaterialPageRoute(
            //             builder: (_) => AuthenticationWrapper()));
            //       },
            //       style: ButtonStyle(
            //         foregroundColor: MaterialStateProperty.all<Color>(
            //             Constant.app_primary_color),
            //         backgroundColor: MaterialStateProperty.all<Color>(
            //           Constant.app_primary_contrast_color,
            //         ),
            //         padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            //           EdgeInsets.all(10.0),
            //         ),
            //         minimumSize: MaterialStateProperty.all<Size>(
            //           Size(Constant.app_button_min_width,
            //               Constant.app_button_height),
            //         ),
            //         maximumSize: MaterialStateProperty.all<Size>(
            //           Size(Constant.app_button_max_width,
            //               Constant.app_button_height),
            //         ),
            //         shape: MaterialStateProperty.all(
            //           RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(
            //               Constant.app_button_border_radius,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
