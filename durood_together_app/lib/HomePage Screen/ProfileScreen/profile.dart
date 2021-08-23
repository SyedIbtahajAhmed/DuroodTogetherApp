import 'package:durood_together_app/Authentication/Authentication.dart';
import 'package:durood_together_app/HomePage%20Screen/ProfileScreen/ProfileBody/profileBody.dart';
import 'package:durood_together_app/HomePage%20Screen/ProfileScreen/ProfileHeader/profileheader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Profile Header Widget
        ProfileHeader(),

        // Profile Container
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Column(
                children: [
                  ProfileBody(),
                  IntrinsicHeight(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<Authentication>().signOut();
                          },
                          child: Text(
                            'SIGNOUT',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900]),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            minimumSize:
                                MaterialStateProperty.all<Size>(Size(20, 50)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
