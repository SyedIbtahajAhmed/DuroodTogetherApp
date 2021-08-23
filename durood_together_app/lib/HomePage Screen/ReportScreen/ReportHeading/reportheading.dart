import 'package:flutter/material.dart';

class ReportHeading extends StatelessWidget {
  final String heading;
  const ReportHeading({Key key, this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      // height: screenSize.height / 10,

      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Container(
              child: Center(
                child: Text(
                  this.heading,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
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
