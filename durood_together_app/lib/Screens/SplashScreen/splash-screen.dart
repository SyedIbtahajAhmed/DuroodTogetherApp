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
      backgroundColor: Constant.app_primary_color,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
// Image Container
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: screenSize.height / 2 * 0.35),
              child: Container(
                width: 250,
                height: 250,
                child: Image(
                  image: AssetImage('images/logo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          Spacer(),

          Container(
            // padding: EdgeInsets.only(
            //   top: 150.0,
            // ),
            decoration: BoxDecoration(
              color: Constant.app_primary_contrast_color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(screenSize.width / 2 * 3.0),
                topRight: Radius.circular(screenSize.width / 2 * 3.0),
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color: Constant.app_primary_contrast_color.withOpacity(0.7),
              //     spreadRadius: 4,
              //     blurRadius: 5,
              //     offset: Offset(3, 5), // changes position of shadow
              //   ),
              // ],
            ),
            child: Container(
              width: double.infinity,
              height: screenSize.height * 0.45,
              child: Padding(
                padding: EdgeInsets.only(top: screenSize.height * 0.25),
                child: Column(
                  children: [
                    Text(
                      "Be a part of the barakah",
                      style: TextStyle(
                        color: Constant.app_primary_color,
                        fontSize: Constant.h2,
                        fontWeight: Constant.app_font_weight,
                        letterSpacing: Constant.app_normal_letter_spacing,
                      ),
                    ),
                    Text(
                      "cricle of durood shareef",
                      style: TextStyle(
                        color: Constant.app_primary_color,
                        fontSize: Constant.h3,
                        fontWeight: Constant.app_font_weight,
                        letterSpacing: Constant.app_normal_letter_spacing,
                      ),
                    ),
                  ],
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
    );
  }
}
