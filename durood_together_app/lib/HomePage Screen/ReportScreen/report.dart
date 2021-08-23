import 'package:durood_together_app/HomePage%20Screen/ReportScreen/ReportCountWidget/reportcount.dart';
import 'package:durood_together_app/HomePage%20Screen/ReportScreen/ReportHeading/reportheading.dart';
import 'package:durood_together_app/HomePage%20Screen/ReportScreen/RerpotHeader/reportheader.dart';
import 'package:durood_together_app/HomePage%20Screen/ReportScreen/TotalCountWidget/totalcountwidget.dart';
import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  const Report({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            // Report Header Line
            ReportHeader(
              opacity: 1.0,
            ),

            // Report Count Total
            ReportCount(),

            // Count Heading Container
            ReportHeading(
              heading: "My Durood Count",
            ),

            // Durood Count Widget
            TotalCountWidget(),

            // Count Heading Container
            ReportHeading(
              heading: "Location Wise Count",
            ),

            // Location Wise Count Widget
            TotalCountWidget(),

            // City Wise Count Widget
            // Durood Count Widget
            Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 10.0),
              child: TotalCountWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
