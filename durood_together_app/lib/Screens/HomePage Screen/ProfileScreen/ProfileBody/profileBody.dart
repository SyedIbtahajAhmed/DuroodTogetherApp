import 'package:durood_together_app/Core/DataModels/UserLocation/user_location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'FieldWidget/fieldWidget.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key key}) : super(key: key);

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final firebaseUser = Provider.of<User>(context);
    final userLocation = Provider.of<UserLocation>(context);

    return Container(
      width: screenSize.width / 2 * 1.6,
      // height: screenSize.height / 4.5 * 2,
      decoration: BoxDecoration(
        color: Colors.teal[800],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(screenSize.width / 30),
          topRight: Radius.circular(screenSize.width / 30),
          bottomLeft: Radius.circular(screenSize.width / 30),
          bottomRight: Radius.circular(screenSize.width / 30),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.teal.withOpacity(0.5),
        //     spreadRadius: 5,
        //     blurRadius: 20,
        //     offset: Offset(0, 3), // changes position of shadow
        //   ),
        // ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          left: 15.0,
          right: 15.0,
          bottom: 10.0,
        ),
        child: Container(
          child: Column(
            children: <Widget>[
              // Name Widget
              FieldWidget(
                data: firebaseUser.displayName,
              ),
              // Email Widget
              FieldWidget(
                data: firebaseUser.email,
              ),
              // Country Widget
              FieldWidget(
                data: userLocation.addresses[0].country,
              ),
              // City Widget
              FieldWidget(
                data: userLocation.addresses[0].locality,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
