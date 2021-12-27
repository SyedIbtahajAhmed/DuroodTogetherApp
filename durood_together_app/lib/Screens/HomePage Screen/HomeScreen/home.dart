import 'package:durood_together_app/Screens/HomePage%20Screen/ReportScreen/RerpotHeader/reportheader.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

import 'CountFieldWidget/countField.dart';
import 'CountSaveButton/countSaveButton.dart';
import 'ExpandedWidget/expandedWidget.dart';
import 'HeaderRow/header_row.dart';
import 'HomeCountTabs/homeCountTabs.dart';
import 'ReportCountWidget/reportcount.dart';
import 'UnExpandWidget/unExpandedWidget.dart';

class Home extends StatefulWidget {
  const Home({key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool expanded = false;

  void ExpandWidget() {
    setState(() {
      this.expanded = !this.expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        // duration: Duration(milliseconds: 500),
        // curve: Curves.easeOut,
        child: Column(
          children: <Widget>[
            // Header Row When Expanded
            // Save Button Appeared
            HeaderRow(
              opacity: this.expanded ? 0.0 : 1.0,
            ),

            // Report Header Line
            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(milliseconds: 1000),
              builder: (context, value, _) {
                return Transform.translate(
                  offset: Offset(0.0, 10.0 * value),
                  child: ReportHeader(
                    opacity: this.expanded ? 0.0 : 1.0,
                  ),
                );
              },
            ),

            // Report Count Total
            AnimatedOpacity(
              opacity: this.expanded ? 0.0 : 1.0,
              duration: Duration(milliseconds: 1000),
              child: ReportCount(
                expanded: this.expanded,
              ),
            ),

            // Heading
            AnimatedOpacity(
              opacity: this.expanded ? 0.0 : 1.0,
              duration: Duration(milliseconds: 1000),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInExpo,
                height: this.expanded ? 0.0 : 70,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Text(
                    'Durood Shareef Count',
                    style: TextStyle(
                      fontSize: Constant.h2,
                      color: Constant.app_primary_color,
                      fontWeight: Constant.app_font_weight,
                    ),
                  ),
                ),
              ),
            ),

            // Count Tabs Row
            AnimatedOpacity(
              opacity: this.expanded ? 0.0 : 1.0,
              duration: Duration(milliseconds: 300),
              child: HomeCountTabs(
                opacity: this.expanded ? 0.0 : 1.0,
              ),
            ),

            // Count Field Widget
            TweenAnimationBuilder(
                tween: Tween(begin: 1.0, end: 0.0),
                duration: Duration(milliseconds: 1000),
                builder: (context, value, _) {
                  return Transform.translate(
                    offset: Offset(0.0, 150.0 * value),
                    child: AnimatedOpacity(
                      opacity: this.expanded ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 300),
                      child: CountField(
                        opacity: this.expanded ? 0.0 : 1.0,
                      ),
                    ),
                  );
                }),

            TweenAnimationBuilder(
                tween: Tween(begin: 1.0, end: 0.0),
                duration: Duration(milliseconds: 3000),
                curve: Curves.easeInOutCubicEmphasized,
                builder: (context, value, Widget child) {
                  return Transform.translate(
                    offset: Offset(0.0, 200.0 * value),
                    child: AnimatedOpacity(
                      opacity: this.expanded ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 500),
                      child: CountSaveButton(
                        opacity: this.expanded ? 0.0 : 1.0,
                      ),
                    ),
                  );
                }),

            // Save Button
            // AnimatedOpacity(
            //   opacity: this.expanded ? 0.0 : 1.0,
            //   duration: const Duration(milliseconds: 1000),
            //   child: CountSaveButton(
            //     opacity: this.expanded ? 0.0 : 1.0,
            //   ),
            // ),

            !this.expanded
                ? SizedBox(
                    height: screenSize.height / 2 * 0.25,
                  )
                : Container(),

            // Count Expansion Button
            !this.expanded
                ? UnExpandedWidget(
                    unExpandedWidget: ExpandWidget,
                  )
                : ExpandedWidget(
                    expandedWidget: ExpandWidget,
                  ),
          ],
        ),
      ),
    );
  }
}
