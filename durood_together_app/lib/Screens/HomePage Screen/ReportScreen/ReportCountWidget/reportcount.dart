import 'package:flutter/material.dart';

import 'InfoContainer/InfoContainer.dart';

class ReportCount extends StatelessWidget {
  const ReportCount({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: 350,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.teal[700],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(screenSize.width / 20),
          topRight: Radius.circular(screenSize.width / 20),
          bottomLeft: Radius.circular(screenSize.width / 20),
          bottomRight: Radius.circular(screenSize.width / 20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(3, 5), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(screenSize.width / 20),
            topRight: Radius.circular(screenSize.width / 20),
            bottomLeft: Radius.circular(screenSize.width / 20),
            bottomRight: Radius.circular(screenSize.width / 20),
          ),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.teal[700].withOpacity(0.5),
              BlendMode.dstATop,
            ),
            image: AssetImage("images/ReportCount_Pic.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: InfoContainer(),
      ),
    );
  }
}
