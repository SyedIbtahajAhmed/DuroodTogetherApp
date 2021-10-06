import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Local Imports
import 'package:durood_together_app/Authentication/Authentication.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Form Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Email And Password Declaration
  String _email, _password;

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
  void initState() {
    // TODO: implement initState
    super.initState();
    // this.checkAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal[900],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(300),
                  bottomRight: Radius.circular(800),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 150.0, bottom: 250.0),
                child: Container(
                  child: Center(
                    child: Text(
                      "Durood Together",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
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
                              if (input.isEmpty) return 'Please Enter Email.';
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.teal[900].withOpacity(0.1),
                              border: OutlineInputBorder(),
                              labelText: 'Enter Your Email',
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.teal[900].withOpacity(0.8),
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
                              fillColor: Colors.teal[900].withOpacity(0.1),
                              border: OutlineInputBorder(),
                              labelText: 'Enter Your Password',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.teal[900].withOpacity(0.8),
                              ),
                            ),
                            obscureText: true,
                            onSaved: (input) => _password = input,
                          ),
                        ),
                      ),

                      // Elevated Button
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 50.0,
                          bottom: 20.0,
                          right: 20.0,
                          left: 20.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                context.read<Authentication>().signIn(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.teal[900].withOpacity(0.9),
                                ),
                                minimumSize: MaterialStateProperty.all<Size>(
                                  Size(150, 50),
                                ),
                                // shape: MaterialStateProperty.all<BorderRadius>(
                                //   BorderRadius.all(Radius.circular(10)),
                                // ),
                              ),
                              autofocus: false,
                            ),

                            // Elevated Button
                            ElevatedButton(
                              onPressed: () {
                                context.read<Authentication>().signUp(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.teal[900].withOpacity(0.9),
                                ),
                                minimumSize: MaterialStateProperty.all<Size>(
                                  Size(150, 50),
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
          ],
        ),
      ),
    ),
    );
  }
}
