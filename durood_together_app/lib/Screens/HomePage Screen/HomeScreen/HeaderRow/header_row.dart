import 'package:durood_together_app/Core/DataViewModels/DuroodCountModel/duroodCountVM.dart';
import 'package:durood_together_app/Core/Providers/DuroodCountProvider/durood-count-provider.dart';
import 'package:durood_together_app/Services/LocationService/location_service.dart';
import 'package:durood_together_app/Shared/SharedFunctions/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class HeaderRow extends StatelessWidget {
  final double opacity;
  const HeaderRow({Key key, this.opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInExpo,
      width: (screenSize.width / 5) * 4.5,
      height: this.opacity == 0.0 ? 100 : 0,
      // color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, left: 10.0, right: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Save Button
            SizedBox(
              height: this.opacity == 0.0 ? 40 : 0,
              child: ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> dataObject = new Map<String, dynamic>();

                  // Storing Data
                  dataObject['City'] = context
                      .read<LocationService>()
                      .userAddress[0]
                      .locality
                      .toString();
                  dataObject['Country'] = context
                      .read<LocationService>()
                      .userAddress[0]
                      .country
                      .toString();
                  dataObject['User'] = context.read<User>().uid;
                  dataObject['DuroodCount'] =
                      context.read<DuroodCountProvider>().duroodCount;

                  print(dataObject);
                  DuroodCountVM().addCustomDuroodCount(
                      context, dataObject, Functions().getDateString());

                  context.read<DuroodCountProvider>().resetDuroodCount();
                },
                child: Text(
                  'Save Count',
                  style: TextStyle(
                    color: Colors.teal[900],
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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
