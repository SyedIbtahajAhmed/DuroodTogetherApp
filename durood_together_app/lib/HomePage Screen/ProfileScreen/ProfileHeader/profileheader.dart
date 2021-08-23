import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Container(
      width: screenSize.width,
      height: screenSize.height / 4.5,
      decoration: BoxDecoration(
        color: Colors.teal[700],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(screenSize.width / 13.5),
          bottomRight: Radius.circular(screenSize.width / 13.5),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.teal.withOpacity(1),
        //     spreadRadius: 5,
        //     blurRadius: 20,
        //     offset: Offset(0, 3), // changes position of shadow
        //   ),
        // ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Container(
              child: Center(
                child: Text(
                  "BE A PART OF THE BARAKAH CIRCLE OF DUROOD SHAREEF",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              child: Center(
                child: Text(
                  "Your Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
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
