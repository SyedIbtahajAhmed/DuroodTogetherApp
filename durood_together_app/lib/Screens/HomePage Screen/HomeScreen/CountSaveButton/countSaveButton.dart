import 'package:durood_together_app/Core/DataViewModels/DuroodCountModel/duroodCountVM.dart';
import 'package:durood_together_app/Core/Providers/DuroodCountProvider/durood-count-provider.dart';
import 'package:durood_together_app/Services/LocationService/location_service.dart';
import 'package:durood_together_app/Shared/SharedFunctions/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class CountSaveButton extends StatelessWidget {
  final double opacity;
  const CountSaveButton({Key key, this.opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInExpo,
      height: this.opacity == 1.0 ? 60 : 0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          child: Center(
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
                    context.read<DuroodCountProvider>().duroodCountField;

                print(dataObject);
                DuroodCountVM().addCustomDuroodCount(
                    context, dataObject, Functions().getDateString());

                context.read<DuroodCountProvider>().resetDuroodCount();
              },
              child: Text(
                'Save Count',
                style: TextStyle(
                  color: Colors.teal[900],
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
