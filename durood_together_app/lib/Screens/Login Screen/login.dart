// Local Imports
import 'package:durood_together_app/Authentication/Authentication.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/HomeScreen/SnackBar/custom-snackbar.dart';
import 'package:durood_together_app/Shared/Components/FacebookSigninButton/facebook-signin-button.dart';
import 'package:durood_together_app/Shared/Components/GoogleSigninButton/google-signin-button.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/src/provider.dart';

import 'LoginFormContainer/login-form-container.dart';
import 'SignupFormContainer/signup-form-container.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Form Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Email And Password Declaration
  String _email, _password;

  // Email SignIn/Register
  bool isEmailSignin = false;
  bool isLoginPressed = false;

  UserCredential googleResult;
  String result;
  String country;
  String city;

  // Making Email And Password Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // checkAuthentication() async {
  //   _auth.authStateChanges().listen((user) {
  //     // Checking If User Is Signed In Or Not
  //     if (user != null) {
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => HomePage()));
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // TabController _tabController;
    // TabController(length: 2, vsync: this);

    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constant.app_primary_color,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(milliseconds: 1000),
              builder: (context, value, _) {
                return Transform.translate(
                  offset: Offset(0.0, 0.0 * value),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 1000),
                    width: double.infinity,
                    height: 480.0 * value,
                    // padding: EdgeInsets.only(
                    //   top: this.isEmailSignin ? 50.0 : screenSize.height * 0.23,
                    //   left: 20.0,
                    //   bottom: this.isEmailSignin ? 140.0 : 170.0,
                    // ),
                    decoration: BoxDecoration(
                      color: Constant.app_primary_contrast_color,
                      borderRadius: BorderRadius.only(
                        bottomLeft:
                            Radius.circular(Constant.app_headers_border_radius),
                        bottomRight:
                            Radius.circular(Constant.app_headers_border_radius),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topCenter,
                        stops: [
                          0.4,
                          1.0,
                        ],
                        colors: [
                          Constant.app_primary_contrast_color,
                          Constant.app_primary_contrast_color_light,
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            // Form Container
            IntrinsicHeight(
              child: Container(
                alignment: Alignment.center,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Durood Picture Top
                      TweenAnimationBuilder(
                        tween: Tween(begin: 0.0, end: 1.0),
                        duration: Duration(milliseconds: 5000),
                        curve: Curves.easeInOutCubicEmphasized,
                        builder: (context, value, Widget child) {
                          return Transform.translate(
                            offset: Offset(0.0, -200.0 * value),
                            child: Container(
                              width: 380,
                              height: 60 * value,
                              child: Image(
                                image: AssetImage('images/durrod.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      ),

                      // Islah - e - Nafs Logo
                      TweenAnimationBuilder(
                        tween: Tween(begin: 1.0, end: 0.0),
                        duration: Duration(milliseconds: 3000),
                        curve: Curves.easeInOutCubicEmphasized,
                        builder: (context, value, Widget child) {
                          return Transform.translate(
                            offset: Offset(0.0, 200.0 * value),
                            child: AnimatedOpacity(
                              opacity: 0.0 * value + 1,
                              duration: const Duration(milliseconds: 500),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: screenSize.height * 0.02),
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Constant.app_primary_color,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(250 / 2)),
                                  ),
                                  child: Image(
                                    image: AssetImage(
                                        'images/islahenafs_logo.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      // Email Sign In/Register Container
                      TweenAnimationBuilder(
                        tween: Tween(begin: 1.0, end: 0.0),
                        duration: Duration(milliseconds: 3000),
                        curve: Curves.easeInOutCubicEmphasized,
                        builder: (context, value, Widget child) {
                          return Transform.translate(
                            offset: Offset(0.0, 200.0 * value),
                            child: AnimatedOpacity(
                              opacity: 0.0 * value + 1,
                              duration: const Duration(milliseconds: 500),
                              child: Stack(
                                // fit: StackFit.expand,
                                children: [
                                  Column(
                                    children: [
                                      // Form Container
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 30.0),
                                        child: Container(
                                          width: 360.0,
                                          decoration: BoxDecoration(
                                            color: Constant.app_primary_color,
                                            border: Border.all(
                                              color: Constant
                                                  .app_primary_contrast_color_light,
                                              width: 1.5,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                Constant
                                                    .app_cards_border_radius,
                                              ),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                spreadRadius: 0.2,
                                                blurRadius: 3,
                                                offset: Offset(0,
                                                    1), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: DefaultTabController(
                                              length: 2,
                                              child: Column(
                                                children: [
                                                  // Tabs
                                                  Container(
                                                    child: TabBar(
                                                      isScrollable: true,
                                                      indicatorColor: Constant
                                                          .app_primary_contrast_color,
                                                      indicatorWeight: 4.0,
                                                      labelColor: Constant
                                                          .app_primary_contrast_color,
                                                      labelStyle: TextStyle(
                                                        fontSize: Constant.h3,
                                                        fontWeight: Constant
                                                            .app_medium_font_weight,
                                                      ),
                                                      unselectedLabelColor: Constant
                                                          .app_primary_contrast_color_light,
                                                      unselectedLabelStyle:
                                                          TextStyle(
                                                        fontSize: Constant.h4,
                                                        fontWeight: Constant
                                                            .app_medium_font_weight,
                                                      ),
                                                      tabs: [
                                                        Tab(
                                                          text: "Signin",
                                                        ),
                                                        Tab(
                                                          text: "Signup",
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  Container(
                                                    width: 350,
                                                    height: 215,
                                                    child: TabBarView(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 30.0),
                                                          child:
                                                              LoginFormContainer(
                                                            emailController:
                                                                emailController,
                                                            passwordController:
                                                                passwordController,
                                                          ),
                                                        ),
                                                        // Container(
                                                        //   color: Colors.red,
                                                        // ),
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 30.0),
                                                          child:
                                                              SignupFormContainer(
                                                            emailController:
                                                                emailController,
                                                            passwordController:
                                                                passwordController,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Extra Container
                                      Container(
                                        // color: Colors.red,
                                        width: 80.0,
                                        height: 40.0,
                                      ),
                                    ],
                                  ),

                                  // Login Button
                                  // Email Sign in Elevated Button
                                  Positioned(
                                    top: 315,
                                    left: 155,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (this.emailController.text.isEmpty ||
                                            this.emailController.text == '' ||
                                            this
                                                .passwordController
                                                .text
                                                .isEmpty ||
                                            this.passwordController.text ==
                                                '') {
                                          final snackBar = SnackBar(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10.0,
                                              vertical: 30.0,
                                            ),
                                            backgroundColor: Constant
                                                .app_primary_contrast_color
                                                .withOpacity(0.7),
                                            content: CustomSnackbar(
                                              text: 'Please Enter Details',
                                            ),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        } else {
                                          setState(() {
                                            this.isLoginPressed =
                                                !this.isLoginPressed;
                                          });

                                          context.read<Authentication>().signIn(
                                                email:
                                                    emailController.text.trim(),
                                                password: passwordController
                                                    .text
                                                    .trim(),
                                              );
                                        }
                                      },
                                      child: Icon(Icons.forward),
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                          Constant.app_primary_contrast_color,
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          Constant.app_primary_color,
                                        ),
                                        elevation:
                                            MaterialStateProperty.all<double>(
                                                20.0),
                                        // padding:
                                        //     MaterialStateProperty.all<EdgeInsetsGeometry>(
                                        //   EdgeInsets.all(10.0),
                                        // ),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: Constant
                                                  .app_primary_contrast_color_light,
                                              width: 1.5,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              Constant.app_button_border_radius,
                                            ),
                                          ),
                                        ),
                                        minimumSize:
                                            MaterialStateProperty.all<Size>(
                                          Size(Constant.app_button_min_width,
                                              Constant.app_button_height),
                                        ),
                                        maximumSize:
                                            MaterialStateProperty.all<Size>(
                                          Size(Constant.app_button_max_width,
                                              Constant.app_button_height),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      // Login Using Container
                      TweenAnimationBuilder(
                        tween: Tween(begin: 1.0, end: 0.0),
                        duration: Duration(milliseconds: 3000),
                        curve: Curves.easeInOutCubicEmphasized,
                        builder: (context, value, Widget child) {
                          return Transform.translate(
                            offset: Offset(0.0, 200.0 * value),
                            child: AnimatedOpacity(
                              opacity: 0.0 * value + 1,
                              duration: const Duration(milliseconds: 500),
                              child: Container(
                                child: Text(
                                  "or login using",
                                  style: TextStyle(
                                    color: Constant
                                        .app_primary_contrast_color_light,
                                    fontSize: Constant.h5,
                                    fontWeight: Constant.app_medium_font_weight,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      // Login Options Button Row
                      TweenAnimationBuilder(
                        tween: Tween(begin: 1.0, end: 0.0),
                        duration: Duration(milliseconds: 3000),
                        curve: Curves.easeInOutCubicEmphasized,
                        builder: (context, value, Widget child) {
                          return Transform.translate(
                            offset: Offset(0.0, 200.0 * value),
                            child: AnimatedOpacity(
                              opacity: 0.0 * value + 1,
                              duration: const Duration(milliseconds: 500),
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Google Sign in Elevated Button
                                    GoogleSigninButton(),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    // Google Sign in Elevated Button
                                    FacebookSigninButton(),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      Container(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          "Join the Barakah Circle of",
                          style: TextStyle(
                            color: Constant.app_primary_contrast_color_light,
                            fontSize: Constant.h4,
                            fontWeight: Constant.app_medium_font_weight,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Durood Shareef",
                          style: TextStyle(
                            color: Constant.app_primary_contrast_color_light,
                            fontSize: 40.0,
                            fontWeight: Constant.app_font_weight,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "to maximize blessings",
                          style: TextStyle(
                            color: Constant.app_primary_contrast_color_light,
                            fontSize: Constant.h4,
                            fontWeight: Constant.app_font_weight,
                          ),
                        ),
                      ),

                      // Sign in with Container
                      // Container(
                      //   padding: EdgeInsets.only(
                      //     top: 10.0,
                      //   ),
                      //   child: Text(
                      //     "Sign in with",
                      //     style: TextStyle(
                      //       fontSize: Constant.h6,
                      //       color: Constant.app_primary_contrast_color
                      //           .withOpacity(0.9),
                      //       fontWeight: Constant.app_font_weight,
                      //       letterSpacing: Constant.app_normal_letter_spacing,
                      //     ),
                      //   ),
                      // ),
                    ],
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
