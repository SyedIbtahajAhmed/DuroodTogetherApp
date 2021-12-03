// Local Imports
import 'package:durood_together_app/Authentication/Authentication.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/HomeScreen/SnackBar/custom-snackbar.dart';
import 'package:durood_together_app/Shared/Components/GoogleSigninButton/google-signin-button.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/src/provider.dart';

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
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constant.app_primary_color,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: this.isEmailSignin ? 50.0 : screenSize.height * 0.3,
                  left: 20.0,
                  bottom: this.isEmailSignin ? 140.0 : 170.0,
                ),
                decoration: BoxDecoration(
                  color: Constant.app_primary_contrast_color,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(300),
                    bottomRight: this.isEmailSignin
                        ? Radius.circular(600)
                        : Radius.circular(800),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Durood",
                      style: TextStyle(
                        color: Constant.app_primary_color,
                        fontSize: Constant.h1,
                        fontWeight: Constant.app_font_weight,
                        letterSpacing: Constant.app_max_letter_spacing,
                      ),
                    ),
                    Text(
                      "Together",
                      style: TextStyle(
                        color: Constant.app_primary_color,
                        fontSize: Constant.h1,
                        fontWeight: Constant.app_font_weight,
                        letterSpacing: Constant.app_max_letter_spacing,
                      ),
                    ),
                  ],
                ),
              ),
              // Form Container
              IntrinsicHeight(
                child: Container(
                  alignment: Alignment.center,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Email Sign In/Register Container
                        AnimatedOpacity(
                          opacity: !this.isEmailSignin ? 0.0 : 1.0,
                          duration: Duration(
                              milliseconds: this.isEmailSignin ? 300 : 300),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: AnimatedContainer(
                              duration: Duration(
                                  milliseconds:
                                      this.isEmailSignin ? 1000 : 1000),
                              curve: Curves.easeInOutCubicEmphasized,
                              height: this.isEmailSignin ? 350.0 : 0.0,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    // Email Container
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 70.0,
                                        // right: 20.0,
                                        // left: 20.0,
                                      ),
                                      child: Container(
                                        //width: 50.0.w,
                                        child: TextFormField(
                                          controller: emailController,
                                          validator: (input) {
                                            if (input.isEmpty)
                                              return 'Please Enter Email.';
                                          },
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Constant
                                                .app_primary_contrast_color
                                                .withOpacity(0.1),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            labelText: 'Enter Your Email',
                                            floatingLabelStyle: TextStyle(
                                              color: Constant
                                                  .app_primary_contrast_color,
                                              fontSize: Constant.h4,
                                            ),
                                            prefixIcon: Icon(
                                              Icons.email,
                                              color: Constant
                                                  .app_primary_contrast_color
                                                  .withOpacity(0.8),
                                            ),
                                          ),
                                          onSaved: (input) => _email = input,
                                        ),
                                      ),
                                    ),

                                    // Password Container
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 30.0,
                                        // right: 20.0,
                                        // left: 20.0,
                                      ),
                                      child: Container(
                                        child: TextFormField(
                                          controller: passwordController,
                                          validator: (input) {
                                            if (input.isEmpty)
                                              return 'Please Enter Minimum 6 Characters.';
                                          },
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Constant
                                                .app_primary_contrast_color
                                                .withOpacity(0.1),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            labelText: 'Enter Your Password',
                                            floatingLabelStyle: TextStyle(
                                              color: Constant
                                                  .app_primary_contrast_color,
                                              fontSize: Constant.h4,
                                            ),
                                            prefixIcon: Icon(
                                              Icons.lock,
                                              color: Constant
                                                  .app_primary_contrast_color
                                                  .withOpacity(0.8),
                                            ),
                                          ),
                                          obscureText: true,
                                          onSaved: (input) => _password = input,
                                        ),
                                      ),
                                    ),

                                    // Forgot Password Container
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            child: InkWell(
                                              child: Text(
                                                "Forgot Password?",
                                                style: TextStyle(
                                                  color: Constant
                                                      .app_primary_contrast_color,
                                                  fontSize: Constant.h4,
                                                  fontWeight:
                                                      Constant.app_font_weight,
                                                  letterSpacing: Constant
                                                      .app_normal_letter_spacing,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Login Elevated Button
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 40.0,
                                        bottom: 30.0,
                                        right: 20.0,
                                        left: 20.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              if (this
                                                      .emailController
                                                      .text
                                                      .isEmpty ||
                                                  this.emailController.text ==
                                                      '' ||
                                                  this
                                                      .passwordController
                                                      .text
                                                      .isEmpty ||
                                                  this
                                                          .passwordController
                                                          .text ==
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
                                                    text:
                                                        'Please Enter Details',
                                                  ),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              } else {
                                                setState(() {
                                                  this.isLoginPressed =
                                                      !this.isLoginPressed;
                                                });

                                                context
                                                    .read<Authentication>()
                                                    .signIn(
                                                      email: emailController
                                                          .text
                                                          .trim(),
                                                      password:
                                                          passwordController
                                                              .text
                                                              .trim(),
                                                    );
                                              }
                                            },
                                            child: !this.isLoginPressed
                                                ? Text(
                                                    'Login',
                                                    style: TextStyle(
                                                      fontSize: Constant
                                                          .app_button_font_size,
                                                      fontWeight: Constant
                                                          .app_font_weight,
                                                      color: Constant
                                                          .app_primary_color,
                                                      letterSpacing: Constant
                                                          .app_normal_letter_spacing,
                                                    ),
                                                  )
                                                : CircularProgressIndicator(
                                                    color: Constant
                                                        .app_primary_color,
                                                  ),
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(
                                                Constant
                                                    .app_primary_contrast_color
                                                    .withOpacity(0.9),
                                              ),
                                              minimumSize: MaterialStateProperty
                                                  .all<Size>(
                                                Size(
                                                    Constant
                                                        .app_button_min_width,
                                                    Constant.app_button_height),
                                              ),
                                              maximumSize: MaterialStateProperty
                                                  .all<Size>(
                                                Size(
                                                    Constant
                                                        .app_button_max_width,
                                                    Constant.app_button_height),
                                              ),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    Constant
                                                        .app_button_border_radius,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            autofocus: false,
                                          ),

                                          // Register Elevated Button
                                          // ElevatedButton(
                                          //   onPressed: () async {
                                          //     country = context
                                          //                 .read<
                                          //                     LocationService>()
                                          //                 .userAddress
                                          //                 .length >
                                          //             0
                                          //         ? context
                                          //             .read<LocationService>()
                                          //             .userAddress[0]
                                          //             .country
                                          //             .toString()
                                          //         : '';
                                          //     city = context
                                          //                 .read<
                                          //                     LocationService>()
                                          //                 .userAddress
                                          //                 .length >
                                          //             0
                                          //         ? context
                                          //             .read<LocationService>()
                                          //             .userAddress[0]
                                          //             .locality
                                          //             .toString()
                                          //         : '';
                                          //
                                          //     print(country);
                                          //     print(city);
                                          //
                                          //     result = await context
                                          //         .read<Authentication>()
                                          //         .signUp(
                                          //           email: emailController.text
                                          //               .trim(),
                                          //           password: passwordController
                                          //               .text
                                          //               .trim(),
                                          //           country: country,
                                          //           city: city,
                                          //         );
                                          //
                                          //     print(result);
                                          //     emailController.clear();
                                          //     passwordController.clear();
                                          //   },
                                          //   child: Text(
                                          //     'Register',
                                          //     style: TextStyle(
                                          //       fontSize: 20.0,
                                          //       fontWeight: FontWeight.w600,
                                          //       color: Constant.app_primary_color,
                                          //       letterSpacing: 2.0,
                                          //     ),
                                          //   ),
                                          //   style: ButtonStyle(
                                          //     backgroundColor:
                                          //         MaterialStateProperty.all<
                                          //             Color>(
                                          //       Constant.app_primary_contrast_color
                                          //           .withOpacity(0.9),
                                          //     ),
                                          //     minimumSize: MaterialStateProperty
                                          //         .all<Size>(
                                          //       Size(150, 50),
                                          //     ),
                                          //     shape: MaterialStateProperty.all(
                                          //       RoundedRectangleBorder(
                                          //           borderRadius:
                                          //               BorderRadius.circular(
                                          //                   20.0)),
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Email Sign in Elevated Button
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          padding: EdgeInsets.only(bottom: 20.0),
                          margin: EdgeInsets.only(
                            top: this.isEmailSignin
                                ? screenSize.height * 0.005
                                : screenSize.height * 0.12,
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                this.isEmailSignin = !this.isEmailSignin;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.easeIn,
                              child: !this.isEmailSignin
                                  ? Text(
                                      'Email Sign in',
                                      style: TextStyle(
                                        fontSize: Constant.app_button_font_size,
                                        fontWeight: Constant.app_font_weight,
                                        letterSpacing:
                                            Constant.app_normal_letter_spacing,
                                        // color: Constant.app_primary_color,
                                      ),
                                    )
                                  : Icon(
                                      Icons.close_rounded,
                                      // color: Constant.app_primary_color,
                                    ),
                            ),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                Constant.app_primary_color,
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Constant.app_primary_contrast_color,
                              ),
                              // padding:
                              //     MaterialStateProperty.all<EdgeInsetsGeometry>(
                              //   EdgeInsets.all(10.0),
                              // ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                  this.isEmailSignin
                                      ? 45.0
                                      : Constant.app_button_border_radius,
                                )),
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                Size(
                                    this.isEmailSignin
                                        ? 60.0
                                        : Constant.app_button_min_width,
                                    Constant.app_button_height),
                              ),
                              maximumSize: MaterialStateProperty.all<Size>(
                                Size(Constant.app_button_max_width,
                                    Constant.app_button_height),
                              ),
                            ),
                          ),
                        ),

                        // Sign in with Container
                        Container(
                          padding: EdgeInsets.only(
                            top: 10.0,
                          ),
                          child: Text(
                            "Sign in with",
                            style: TextStyle(
                              fontSize: Constant.h6,
                              color: Constant.app_primary_contrast_color
                                  .withOpacity(0.9),
                              fontWeight: Constant.app_font_weight,
                              letterSpacing: Constant.app_normal_letter_spacing,
                            ),
                          ),
                        ),

                        // Google Sign in Elevated Button
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 30.0,
                          ),
                          margin: EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                          ),
                          // decoration: BoxDecoration(
                          //   border: Border(
                          //     top: BorderSide(
                          //       color: Constant.app_primary_contrast_color.withOpacity(0.2),
                          //       width: 2.0,
                          //     ),
                          //   ),
                          // ),
                          child: GoogleSigninButton(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
