import 'package:flutter/material.dart';

class DateTextContainer extends StatelessWidget {
  final String date;
  final String text;
  const DateTextContainer({Key key, this.date, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          // Date Container
          date != null
              ? Container(
                  child: Text(
                    this.date,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                )
              : Container(),

          // Date Container
          text != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    child: Text(
                      this.text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
