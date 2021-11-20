import 'package:durood_together_app/Core/DataViewModels/DuroodCountModel/duroodCountVM.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/ReportScreen/ReportScreenInfoContainer/report-screen-info-container.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'ReportHeading/reportheading.dart';
import 'RerpotHeader/reportheader.dart';
import 'TotalCountWidget/totalcountwidget.dart';

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
            ReportScreenInfoContainer(),

            // Count Heading Container
            ReportHeading(
              heading: "My Durood Count",
            ),

            // Durood Count Widget
            TotalCountWidget(
              tableHeader: '',
              data: context.watch<DuroodCountVM>().userMonthlyData,
            ),

            // Count Heading Container
            ReportHeading(
              heading: "Location Wise Count",
            ),

            // Location Wise Count Widget
            TotalCountWidget(
              tableHeader: "Countries Data",
              data: context.watch<DuroodCountVM>().topFiveCountries,
            ),

            // City Wise Count Widget
            // Durood Count Widget
            Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 10.0),
              child: TotalCountWidget(
                tableHeader: "Cities Data",
                data: context.watch<DuroodCountVM>().topFiveCities,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
