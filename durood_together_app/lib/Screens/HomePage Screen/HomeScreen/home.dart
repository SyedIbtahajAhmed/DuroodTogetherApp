import 'package:durood_together_app/Core/Providers/DuroodCountProvider/durood-count-provider.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/ReportScreen/RerpotHeader/reportheader.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

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

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Durood Container
                Container(
                  width: double.infinity,
                  padding: this.expanded
                      ? EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0)
                      : EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
                  decoration: BoxDecoration(
                      // color: Colors.red,
                      ),
                  child: Text(
                    context.watch<DuroodCountProvider>().duroodSelected != ''
                        ? Constant().duroodList[context
                            .watch<DuroodCountProvider>()
                            .duroodSelected
                            .toString()]
                        : 'Select Durood In Settings',
                    textAlign: TextAlign.center,
                    // textDirection: TextDirection.rtl,
                    softWrap: true,
                    style: TextStyle(
                      color: Constant.app_primary_color,
                      fontSize: Constant.h7,
                      fontWeight: Constant.app_font_weight,
                    ),
                  ),
                ),

                // Report Header Line
                TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: Duration(milliseconds: 1000),
                  builder: (context, value, _) {
                    return Transform.translate(
                      offset: Offset(0.0, -20.0 + 20.0 * value),
                      child: ReportHeader(
                        opacity: this.expanded ? 0.0 : 1.0,
                      ),
                    );
                  },
                ),
              ],
            ),

            // TweenAnimationBuilder<double>(
            //   duration: Duration(milliseconds: 1500),
            //   tween: Tween(begin: 0.0, end: 1.0),
            //   curve: Curves.easeInOutCubicEmphasized,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       // Durood Container
            //       Container(
            //         width: double.infinity,
            //         padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
            //         decoration: BoxDecoration(
            //             // color: Colors.red,
            //             ),
            //         child: Text(
            //           Constant().duroodList[context
            //               .watch<DuroodCountProvider>()
            //               .duroodSelected
            //               .toString()],
            //           textAlign: TextAlign.center,
            //           // textDirection: TextDirection.rtl,
            //           softWrap: true,
            //           style: TextStyle(
            //             color: Constant.app_primary_contrast_color,
            //             fontSize: Constant.h7,
            //             fontWeight: Constant.app_font_weight,
            //           ),
            //         ),
            //       ),
            //
            //       // Report Header Line
            //       TweenAnimationBuilder(
            //         tween: Tween(begin: 0.0, end: 1.0),
            //         duration: Duration(milliseconds: 1000),
            //         builder: (context, value, _) {
            //           return Transform.translate(
            //             offset: Offset(0.0, 10.0 * value),
            //             child: ReportHeader(
            //               opacity: this.expanded ? 0.0 : 1.0,
            //             ),
            //           );
            //         },
            //       ),
            //     ],
            //   ),
            //   builder: (context, headerValue, Widget child) {
            //     return Container(
            //       width: double.infinity,
            //       height: screenSize.height * 0.31 * headerValue,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.only(
            //           bottomRight:
            //               Radius.circular(Constant.app_headers_border_radius),
            //           bottomLeft:
            //               Radius.circular(Constant.app_headers_border_radius),
            //         ),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Constant.app_primary_contrast_color
            //                 .withOpacity(0.3),
            //             spreadRadius: 4,
            //             blurRadius: 5,
            //             offset: Offset(3, 5), // changes position of shadow
            //           ),
            //         ],
            //         gradient: LinearGradient(
            //           begin: Alignment.topCenter,
            //           end: Alignment.bottomCenter,
            //           stops: [
            //             0.3,
            //             1.0,
            //           ],
            //           colors: [
            //             Constant.app_primary_color.withAlpha(200),
            //             Constant.app_primary_contrast_color,
            //           ],
            //         ),
            //       ),
            //       child: Transform.translate(
            //         offset: Offset(0.0, 10 * headerValue),
            //         child: AnimatedOpacity(
            //           duration: Duration(milliseconds: 2000),
            //           opacity: 1.0 * headerValue,
            //           child: child,
            //         ),
            //       ),
            //     );
            //   },
            // ),

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
                    height: screenSize.height / 2 * 0.1,
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
