import 'package:flutter/material.dart';

import 'InfoContainer/InfoContainer.dart';

class ReportCount extends StatelessWidget {
  const ReportCount({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return IntrinsicHeight(
        child: Container(
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 4,
                blurRadius: 5,
                offset: Offset(3, 5), // changes position of shadow
              ),
            ],
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.teal[700].withOpacity(0.3),
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
