import 'package:durood_together_app/HomePage%20Screen/HomeScreen/HomeCountTabs/HomeCountTabsText/homeCountTabsText.dart';
import 'package:flutter/material.dart';

class HomeCountTabs extends StatefulWidget {
  final double opacity;
  const HomeCountTabs({Key key, this.opacity}) : super(key: key);

  @override
  _HomeCountTabsState createState() => _HomeCountTabsState();
}

class _HomeCountTabsState extends State<HomeCountTabs> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: widget.opacity == 1.0 ? 80 : 0.0,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.teal[700].withOpacity(0.7),
            width: 2.0,
            style: BorderStyle.solid,
          ),
          bottom: BorderSide(
            color: Colors.teal[700].withOpacity(0.7),
            width: 2.0,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Yesterday Count Tab
            Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Colors.teal[700].withOpacity(0.7),
                    width: 3.0,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      // Count
                      HomeCountTabsText(
                        count: 5,
                      ),
                      // Day
                      HomeCountTabsText(
                        text: 'Yesterday',
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Today Count Tab
            Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Colors.teal[700].withOpacity(0.7),
                    width: 3.0,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      // Count
                      HomeCountTabsText(
                        count: 20,
                      ),
                      // Day
                      HomeCountTabsText(
                        text: 'Today',
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // This Week Count Tab
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      // Count
                      HomeCountTabsText(
                        count: 200,
                      ),
                      // Day
                      HomeCountTabsText(
                        text: 'This Week',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
