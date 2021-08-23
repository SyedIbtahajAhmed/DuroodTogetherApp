import 'package:flutter/material.dart';

class TotalCountWidget extends StatelessWidget {
  const TotalCountWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    List data = ["Pakistan", "US", "India", "Australia", "UK"];
    List data2 = [123, 4142, 24131, 224211, 13212];
    return Container(
      width: (screenSize.width / 5) * 4.5,
      height: (screenSize.height / 2) * 0.88,
      decoration: BoxDecoration(
        color: Colors.teal[800],
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (var item = 0; item < data.length; item++)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      data.elementAt(item).toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      data2.elementAt(item).toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
