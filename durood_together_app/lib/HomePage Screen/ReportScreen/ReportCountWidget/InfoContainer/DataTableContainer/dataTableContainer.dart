import 'package:durood_together_app/Core/DataViewModels/DuroodCountModel/duroodCountVM.dart';
import 'package:durood_together_app/HomePage%20Screen/ReportScreen/ReportCountWidget/InfoContainer/CountTextContainer/countTextContainer.dart';
import 'package:durood_together_app/Shared/SharedFunctions/functions.dart';
import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';
import 'package:provider/provider.dart';

class DataTableContainer extends StatelessWidget {
  const DataTableContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calling The Provider
    final duroodCount = Provider.of<DuroodCountVM>(context);
    return FutureBuilder(
      future: Future.wait(
        [
          Functions().getTopCountry(duroodCount),
          Functions().getTopCity(duroodCount),
        ],
      ),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          return DataTable(
            headingRowHeight: 0,
            columnSpacing: 100.0,
            dataRowHeight: 35.0,
            showBottomBorder: true,
            columns: [
// Name Column
              DataColumn(
                label: CountTextConainer(text: ''),
              ),
// Count Column
              DataColumn(
                label: CountTextConainer(text: ''),
              ),
            ],
            rows: [
// Contry Row
              DataRow(
                cells: [
// Country Name
                  DataCell(
                    CountTextConainer(
                      text: snapshot.data[0].keys.elementAt(0).toString(),
                    ),
                  ),
// Country Count
                  DataCell(
                    CountTextConainer(
                      text: Numeral(
                        snapshot.data[0]
                            [snapshot.data[0].keys.elementAt(0).toString()],
                      ).value().toString(),
                    ),
                  ),
                ],
              ),

// City Name
              DataRow(
                cells: [
// Country Name
                  DataCell(
                    CountTextConainer(
                      text: snapshot.data[1].keys.elementAt(0).toString(),
                    ),
                  ),
// Country Count
                  DataCell(
                    CountTextConainer(
                      text: Numeral(
                        snapshot.data[1]
                            [snapshot.data[1].keys.elementAt(0).toString()],
                      ).value().toString(),
                    ),
                  ),
                ],
              ),
            ],
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
