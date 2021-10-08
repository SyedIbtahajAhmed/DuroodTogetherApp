import 'package:durood_together_app/Core/DataViewModels/DuroodCountModel/duroodCountVM.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/ReportScreen/ReportCountWidget/reportcount.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/ReportScreen/RerpotHeader/reportheader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CountFieldWidget/countField.dart';
import 'CountSaveButton/countSaveButton.dart';
import 'ExpandedWidget/expandedWidget.dart';
import 'HeaderRow/header_row.dart';
import 'HomeCountTabs/homeCountTabs.dart';
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
              HeaderRow(
                opacity: this.expanded ? 0.0 : 1.0,
              ),

              // Report Header Line
              ReportHeader(
                opacity: this.expanded ? 0.0 : 1.0,
              ),

              // Report Count Total
              ReportCount(),

              // Count Field Widget
              AnimatedOpacity(
                opacity: this.expanded ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: CountField(
                  opacity: this.expanded ? 0.0 : 1.0,
                ),
              ),

              // Save Button
              AnimatedOpacity(
                opacity: this.expanded ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 1000),
                child: CountSaveButton(
                  opacity: this.expanded ? 0.0 : 1.0,
                ),
              ),

              // Heading
              AnimatedOpacity(
                opacity: this.expanded ? 0.0 : 1.0,
                duration: Duration(milliseconds: 1000),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInExpo,
                  height: this.expanded ? 0.0 : 40,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0, bottom: 10.0),
                    child: Text(
                      'Your Durood Shareef Count',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
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

              !this.expanded ? SizedBox(
                height: screenSize.height*0.18,
              ) : Container(),

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
