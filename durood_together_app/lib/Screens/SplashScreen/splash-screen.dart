import 'package:durood_together_app/Authentication/Authentication%20Wrapper/AuthenticationWrapper.dart';
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
    //       milliseconds: 2000,
    //     ), () {
    //   Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (_) => AuthenticationWrapper()));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 150.0),
            child: Text(
              "Splash Screen",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 5.0,
              ),
            ),
          ),
          Container(
            child: CircularProgressIndicator(
              color: Colors.teal[900],
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.only(
                top: 20.0,
              ),
              child: ElevatedButton(
                child: Text("Go To Login Page."),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => AuthenticationWrapper()));
                },
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.teal[900],
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.all(10.0),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(250, 70),
                  ),
                  maximumSize: MaterialStateProperty.all<Size>(
                    Size(300, 70),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
