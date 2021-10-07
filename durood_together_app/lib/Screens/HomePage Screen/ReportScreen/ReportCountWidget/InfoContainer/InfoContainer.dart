import 'package:durood_together_app/Core/DataViewModels/DuroodCountModel/duroodCountVM.dart';
import 'package:durood_together_app/Shared/SharedFunctions/functions.dart';
import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';
import 'package:provider/provider.dart';

import 'CountTextContainer/countTextContainer.dart';
import 'DateTextContainer/dateTextContainer.dart';
import 'MonthCountWidget/monthCountWidget.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
            // child: DataTableContainer(),
            child: Column(
              children: [
                // Country Row
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Country Name
                      Container(
                        child: CountTextContainer(
                          text: context.watch<DuroodCountVM>().topCountry.keys.elementAt(0).toString(),
                        ),
                      ),

                      // Country Count Value
                      Container(
                        child: CountTextContainer(
                          text: Numeral(context.watch<DuroodCountVM>().topCountry.values.elementAt(0)).value().toString(),
                        ),
                      ),
                    ],
                  ),
                ),

                // City Row
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Country Name
                      Container(
                        child: CountTextContainer(
                          text: context.watch<DuroodCountVM>().topCity.keys.elementAt(0).toString(),
                        ),
                      ),

                      // Country Count Value
                      Container(
                        child: CountTextContainer(
                          text: Numeral(context.watch<DuroodCountVM>().topCity.values.elementAt(0)).value().toString(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Total Count Widget
          MonthCountWidget(
            text: Functions().getCurrentMonth() + ' Global Count',
            totalCount: Numeral(context.watch<DuroodCountVM>().globalCount).value().toString(),
            // Numeral(snapshot.data.elementAt(0)).value().toString(),
          ),
        ],
      ),
    );
  }
}


//
//
// final dynamic duroodCount = Provider.of<DuroodCountVM>(context);
//
// return FutureBuilder(
// future: Future.wait(
// [
// Functions().getGlobalCount(duroodCount),
// ],
// ),
// builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
// if (snapshot.hasData) {
// return Container(
// child: Column(
// // crossAxisAlignment: CrossAxisAlignment.baseline,
// children: <Widget>[
// DateTextContainer(
// date: Functions().getCurrentMonth() +
// ' ' +
// Functions().getCurrentYear().toString(),
// text: 'Top Durood Contributing Country and City',
// ),
//
// // Country And City Widget
// Container(
// child: DataTableContainer(),
// ),
//
// // Total Count Widget
// MonthCountWidget(
// text: Functions().getCurrentMonth() + ' Global Count',
// totalCount:
// Numeral(snapshot.data.elementAt(0)).value().toString(),
// ),
// ],
// ),
// );
// } else if (snapshot.hasError) {
// return Text('${snapshot.error}');
// } else {
// return AnimatedContainer(
// duration: Duration(milliseconds: 500),
// child: CountTextConainer(
// text: "Please Wait!",
// ),
// );
// }
// },
// );