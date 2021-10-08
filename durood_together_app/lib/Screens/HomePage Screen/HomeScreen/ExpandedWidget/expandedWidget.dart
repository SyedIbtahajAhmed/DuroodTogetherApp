import 'package:durood_together_app/Core/DataModels/DuroodCount/duroodCount_model.dart';
import 'package:durood_together_app/Core/DataViewModels/DuroodCountModel/duroodCountVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:vibration/vibration.dart';

class ExpandedWidget extends StatelessWidget {
  final Function expandedWidget;
  const ExpandedWidget({Key key, this.expandedWidget}) : super(key: key);

  // void getData(durood) async {
  //   List<DuroodCount> duroodCount = await durood.fetchDuroodCounts();
  //   duroodCount.forEach((durood) => print(durood));
  // }

  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<CRUDModel>(context);
    final duroodCount = Provider.of<DuroodCountVM>(context);

    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          child: GestureDetector(
            onTap: () {
              this.expandedWidget();
            },
            child: Container(
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Button Container
                    IntrinsicHeight(
                      child: Transform.rotate(
                        angle: 90 * (pi / 180),
                        child: Icon(
                          Icons.double_arrow_rounded,
                          color: Colors.white,
                          size: 60.0,
                        ),
                      ),
                    ),

                    // Rounded Button
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(
                              side: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          )),
                          primary: Colors.white.withOpacity(0.4),
                        ),
                        child: Container(
                          width: 300,
                          height: 300,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            'Create Product',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Vibration.vibrate(duration: 35);
                          // awiat duroodCount.fetchDuroodCounts();
                          // getData(duroodCount);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
