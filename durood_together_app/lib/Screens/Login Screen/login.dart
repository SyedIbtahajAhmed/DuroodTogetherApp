// Local Imports
import 'package:durood_together_app/Authentication/Authentication.dart';
import 'package:durood_together_app/Services/LocationService/location_service.dart';
import 'package:durood_together_app/Shared/Components/GoogleSigninButton/google-signin-button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      backgroundColor: Colors.white,
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
                  bottom: 170.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.teal[900],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(300),
                    bottomRight: Radius.circular(800),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Durood",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 5.0,
                      ),
                    ),
                    Text(
                      "Together",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 5.0,
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
                          child: AnimatedContainer(
                            duration: Duration(
                                milliseconds: this.isEmailSignin ? 1000 : 1000),
                            curve: Curves.easeInOutCubicEmphasized,
                            height: this.isEmailSignin ? 340.0 : 0.0,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  // Email Container
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 70.0,
                                      right: 20.0,
                                      left: 20.0,
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
                                          fillColor:
                                              Colors.teal[900].withOpacity(0.1),
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
                                            color: Colors.teal[900],
                                            fontSize: 20.0,
                                          ),
                                          prefixIcon: Icon(
                                            Icons.email,
                                            color: Colors.teal[900]
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
                                        top: 30.0, right: 20.0, left: 20.0),
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
                                              Colors.teal[900].withOpacity(0.1),
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
                                            color: Colors.teal[900],
                                            fontSize: 20.0,
                                          ),
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            color: Colors.teal[900]
                                                .withOpacity(0.8),
                                          ),
                                        ),
                                        obscureText: true,
                                        onSaved: (input) => _password = input,
                                      ),
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
                                            context
                                                .read<Authentication>()
                                                .signIn(
                                                  email: emailController.text
                                                      .trim(),
                                                  password: passwordController
                                                      .text
                                                      .trim(),
                                                );
                                          },
                                          child: Text(
                                            'Login',
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              letterSpacing: 2.0,
                                            ),
                                          ),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              Colors.teal[900].withOpacity(0.9),
                                            ),
                                            minimumSize:
                                                MaterialStateProperty.all<Size>(
                                              Size(150, 50),
                                            ),
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                            ),
                                          ),
                                          autofocus: false,
                                        ),

                                        // Register Elevated Button
                                        ElevatedButton(
                                          onPressed: () async {
                                            country = context
                                                        .read<LocationService>()
                                                        .userAddress
                                                        .length >
                                                    0
                                                ? context
                                                    .read<LocationService>()
                                                    .userAddress[0]
                                                    .country
                                                    .toString()
                                                : '';
                                            city = context
                                                        .read<LocationService>()
                                                        .userAddress
                                                        .length >
                                                    0
                                                ? context
                                                    .read<LocationService>()
                                                    .userAddress[0]
                                                    .locality
                                                    .toString()
                                                : '';

                                            print(country);
                                            print(city);

                                            result = await context
                                                .read<Authentication>()
                                                .signUp(
                                                  email: emailController.text
                                                      .trim(),
                                                  password: passwordController
                                                      .text
                                                      .trim(),
                                                  country: country,
                                                  city: city,
                                                );

                                            print(result);
                                            emailController.clear();
                                            passwordController.clear();
                                          },
                                          child: Text(
                                            'Register',
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              letterSpacing: 2.0,
                                            ),
                                          ),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              Colors.teal[900].withOpacity(0.9),
                                            ),
                                            minimumSize:
                                                MaterialStateProperty.all<Size>(
                                              Size(150, 50),
                                            ),
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                            ),
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

                        // Email Sign in Elevated Button
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          padding: EdgeInsets.only(bottom: 20.0),
                          margin: EdgeInsets.only(
                            top: this.isEmailSignin ? 0.0 : 100.0,
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
                                child: Text(
                                  !this.isEmailSignin
                                      ? 'Email Sign in'
                                      : 'Close Email Sign in',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2.0,
                                    // color: Colors.white,
                                  ),
                                )),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.teal[900],
                              ),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                EdgeInsets.all(10.0),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                Size(this.isEmailSignin ? 300 : 250, 70),
                              ),
                              maximumSize: MaterialStateProperty.all<Size>(
                                Size(350, 70),
                              ),
                            ),
                          ),
                        ),

                        // Google Sign in Elevated Button
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 30.0),
                          margin: EdgeInsets.only(left: 20.0, right: 20.0),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Colors.teal[900].withOpacity(0.2),
                                width: 2.0,
                              ),
                            ),
                          ),
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
