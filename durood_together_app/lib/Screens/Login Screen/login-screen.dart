import 'package:durood_together_app/Authentication/Authentication.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/HomeScreen/SnackBar/custom-snackbar.dart';
import 'package:durood_together_app/Shared/Components/FacebookSigninButton/facebook-signin-button.dart';
import 'package:durood_together_app/Shared/Components/GoogleSigninButton/google-signin-button.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Form Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Email And Password Declaration
  String _email, _password;
  dynamic radioValue;

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
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [
              0.03,
              1.0,
            ],
            colors: [
              Constant.app_primary_contrast_color,
              Constant.app_primary_contrast_color_light,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Main Stack
            Stack(
              children: [
                // Madina Background Picture
                Container(
                  width: double.infinity,
                  height: 900.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      // colorFilter: ColorFilter.mode(
                      //   Constant.app_primary_contrast_color.withOpacity(opacity),
                      //   BlendMode.dstATop,
                      // ),
                      image: AssetImage("images/madina.jpg"),
                      fit: BoxFit.cover,
                      opacity: 0.3,
                    ),
                  ),
                ),

                // Header Picture Container
                Container(
                  width: double.infinity,
                  height: 335.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      // colorFilter: ColorFilter.mode(
                      //   Constant.app_primary_contrast_color.withOpacity(opacity),
                      //   BlendMode.dstATop,
                      // ),
                      image: AssetImage("images/header-image.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                // Message Punch Line Container
                Center(
                  child: Column(
                    children: [
                      // Headings
                      TweenAnimationBuilder(
                        tween: Tween(begin: 1.0, end: 0.0),
                        duration: Duration(milliseconds: 3000),
                        curve: Curves.easeInOutCubicEmphasized,
                        builder: (context, value, Widget child) {
                          return Transform.translate(
                            offset: Offset(0.0, 200.0 * value),
                            child: AnimatedOpacity(
                              opacity: 0.0 * value + 1,
                              duration: const Duration(milliseconds: 3000),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 170.0),
                                    child: Text(
                                      "Join the Barakah Circle of",
                                      style: TextStyle(
                                        color: Constant.app_primary_color,
                                        fontSize: Constant.h4,
                                        fontWeight:
                                            Constant.app_medium_font_weight,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Durood Shareef",
                                      style: TextStyle(
                                        color: Constant.app_primary_color,
                                        fontSize: 40.0,
                                        fontWeight: Constant.app_font_weight,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "to maximize blessings",
                                      style: TextStyle(
                                        color: Constant.app_primary_color,
                                        fontSize: Constant.h4,
                                        fontWeight: Constant.app_font_weight,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                          top: ((screenSize.height / 2) - 185),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          width: double.infinity,
                          height: 360.0,
                          decoration: BoxDecoration(
                            color: Constant.app_primary_contrast_color
                                .withAlpha(50)
                                .withOpacity(0.3),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  Constant.app_headers_border_radius),
                              topRight: Radius.circular(
                                  Constant.app_headers_border_radius),
                            ),
                          ),
                          child: Column(
                            children: [
                              // First Row
                              Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Signup Row
                                    Row(
                                      children: [
                                        Text(
                                          'New User ',
                                          style: TextStyle(
                                            color: Constant.app_primary_color,
                                            fontSize: Constant.h7,
                                            fontWeight:
                                                Constant.app_medium_font_weight,
                                            letterSpacing: Constant
                                                .app_normal_letter_spacing,
                                          ),
                                        ),

                                        // Forgot Password Container
                                        Container(
                                          child: InkWell(
                                            child: Text(
                                              "Signup",
                                              style: TextStyle(
                                                color:
                                                    Constant.app_yellow_color,
                                                fontSize: Constant.h7,
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

                                    // Forgot Password Container
                                    Container(
                                      child: InkWell(
                                        child: Text(
                                          "Forgot Password?",
                                          style: TextStyle(
                                            color: Constant.app_primary_color,
                                            fontSize: Constant.h7,
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

                              // Form Container
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Container(
                                  child: Column(
                                    children: [
                                      // Email Container
                                      Container(
                                        //width: 50.0.w,
                                        child: TextFormField(
                                          controller: emailController,
                                          validator: (input) {
                                            if (input.isEmpty)
                                              return 'Please Enter Email.';
                                          },
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor:
                                                Constant.app_primary_color,
                                            enabledBorder: OutlineInputBorder(
                                              // borderSide: BorderSide(
                                              //   width: 1.5,
                                              //   color: Constant
                                              //       .app_primary_contrast_color_light,
                                              // ),
                                              borderRadius:
                                                  BorderRadius.circular(Constant
                                                      .app_text_fields_border_radius),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1.5,
                                                color: Constant
                                                    .app_primary_contrast_color_light,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(Constant
                                                      .app_text_fields_border_radius),
                                            ),
                                            labelText: 'Email Id or Username',
                                            floatingLabelStyle: TextStyle(
                                              color: Constant.app_yellow_color,
                                              fontSize: Constant.h3,
                                            ),
                                            suffixIcon: Icon(
                                              Icons.email,
                                              color: Constant
                                                  .app_primary_contrast_color
                                                  .withOpacity(0.6),
                                            ),
                                          ),
                                          // onSaved: (input) => _email = input,
                                        ),
                                      ),

                                      // Password Container
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 20.0,
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
                                              fillColor:
                                                  Constant.app_primary_color,
                                              enabledBorder: OutlineInputBorder(
                                                // borderSide: BorderSide(
                                                //   width: 1.5,
                                                //   color: Constant
                                                //       .app_primary_contrast_color_light,
                                                // ),
                                                borderRadius: BorderRadius
                                                    .circular(Constant
                                                        .app_text_fields_border_radius),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 1.5,
                                                  color: Constant
                                                      .app_primary_contrast_color_light,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              labelText: 'Password',
                                              floatingLabelStyle: TextStyle(
                                                color:
                                                    Constant.app_yellow_color,
                                                fontSize: Constant.h3,
                                              ),
                                              suffixIcon: Icon(
                                                Icons.lock,
                                                color: Constant
                                                    .app_primary_contrast_color
                                                    .withOpacity(0.6),
                                              ),
                                            ),
                                            obscureText: true,
                                            // onSaved: (input) => _password = input,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Save Password and Sign with Row
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Save Password Row
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Radio(
                                          value: radioValue,
                                          groupValue: radioValue,
                                          onChanged: (value) {
                                            setState(() {
                                              radioValue = value;
                                            });
                                          },
                                        ),
                                        Text(
                                          'Save Password',
                                          style: TextStyle(
                                            color: Constant.app_primary_color,
                                            fontSize: Constant.h7,
                                            fontWeight:
                                                Constant.app_medium_font_weight,
                                            letterSpacing: Constant
                                                .app_normal_letter_spacing,
                                          ),
                                        ),
                                      ],
                                    ),

                                    // Sign with Row
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // Sign with Container
                                        Text(
                                          'Sign with',
                                          style: TextStyle(
                                            color: Constant.app_primary_color,
                                            fontSize: Constant.h7,
                                            fontWeight:
                                                Constant.app_font_weight,
                                            letterSpacing: Constant
                                                .app_normal_letter_spacing,
                                          ),
                                        ),

                                        // Google Sign in Elevated Button
                                        GoogleSigninButton(),
                                        // SizedBox(
                                        //   width: 8.0,
                                        // ),
                                        // Google Sign in Elevated Button
                                        FacebookSigninButton(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              // Login Button
                              ElevatedButton(
                                onPressed: () {
                                  if (this.emailController.text.isEmpty ||
                                      this.emailController.text == '' ||
                                      this.passwordController.text.isEmpty ||
                                      this.passwordController.text == '') {
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
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim(),
                                        );
                                  }
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: Constant.h3,
                                    fontWeight: Constant.app_font_weight,
                                    letterSpacing:
                                        Constant.app_normal_letter_spacing,
                                  ),
                                ),
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Constant.app_yellow_color,
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Constant.app_primary_color,
                                  ),
                                  elevation:
                                      MaterialStateProperty.all<double>(20.0),
                                  // padding:
                                  //     MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  //   EdgeInsets.all(10.0),
                                  // ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      // side: BorderSide(
                                      //   color: Constant
                                      //       .app_primary_contrast_color_light,
                                      //   width: 1.5,
                                      // ),
                                      borderRadius: BorderRadius.circular(
                                        Constant.app_button_border_radius,
                                      ),
                                    ),
                                  ),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                    Size(150, 40),
                                  ),
                                  maximumSize: MaterialStateProperty.all<Size>(
                                    Size(150, 40),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
