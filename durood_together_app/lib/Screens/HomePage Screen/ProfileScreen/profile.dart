import 'package:durood_together_app/Authentication/Authentication.dart';
import 'package:durood_together_app/Core/DataViewModels/DuroodCountModel/duroodCountVM.dart';
import 'package:durood_together_app/Core/Providers/DuroodCountProvider/durood-count-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ProfileBody/profileBody.dart';
import 'ProfileHeader/profileheader.dart';

class Profile extends StatelessWidget {
  const Profile({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            // Profile Header Widget
            ProfileHeader(),

            // Profile Container
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.08),
                  child: Column(
                    children: [
                      ProfileBody(),
                      IntrinsicHeight(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<DuroodCountVM>().resetAttributes();
                                context
                                    .read<DuroodCountProvider>()
                                    .resetDuroodCount();
                                context.read<Authentication>().signOut();
                              },
                              child: Text(
                                'SIGNOUT',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[900]),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                minimumSize: MaterialStateProperty.all<Size>(
                                    Size(60, 50)),
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
        ),
      ),
    );
  }
}
