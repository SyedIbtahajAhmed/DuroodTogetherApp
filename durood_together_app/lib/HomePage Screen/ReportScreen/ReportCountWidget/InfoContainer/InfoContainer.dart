import 'package:durood_together_app/HomePage%20Screen/ReportScreen/ReportCountWidget/InfoContainer/DataTableContainer/dataTableContainer.dart';
import 'package:durood_together_app/HomePage%20Screen/ReportScreen/ReportCountWidget/InfoContainer/DateTextContainer/dateTextContainer.dart';
import 'package:durood_together_app/HomePage%20Screen/ReportScreen/ReportCountWidget/InfoContainer/MonthCountWidget/monthCountWidget.dart';
import 'package:durood_together_app/Core/DataViewModels/DuroodCountModel/duroodCountVM.dart';
import 'package:durood_together_app/Shared/Providers/providers_call.dart';
import 'package:durood_together_app/Shared/SharedFunctions/functions.dart';
import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';
import 'package:provider/provider.dart';

import 'CountTextContainer/countTextContainer.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final duroodCount = Provider.of<DuroodCountVM>(context);

    final dynamic duroodCount = Provider.of<DuroodCountVM>(context);

    return FutureBuilder(
      future: Future.wait(
        [
          Functions().getGlobalCount(duroodCount),
        ],
      ),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.baseline,
              children: <Widget>[
                DateTextContainer(
                  date: Functions().getCurrentMonth() +
                      ' ' +
                      Functions().getCurrentYear().toString(),
                  text: 'Top Durood Contributing Country and City',
                ),

                // Country And City Widget
                Container(
                  child: DataTableContainer(),
                ),

                // Total Count Widget
                MonthCountWidget(
                  text: Functions().getCurrentMonth() + ' Global Count',
                  totalCount:
                      Numeral(snapshot.data.elementAt(0)).value().toString(),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            child: CountTextConainer(
              text: "Please Wait!",
            ),
          );
        }
      },
    );
  }
}
