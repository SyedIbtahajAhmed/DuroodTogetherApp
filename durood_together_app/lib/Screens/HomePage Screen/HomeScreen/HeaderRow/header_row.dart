import 'package:durood_together_app/Core/Providers/DuroodCountProvider/durood-count-provider.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/HomeScreen/SnackBar/custom-snackbar.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:durood_together_app/Shared/SharedFunctions/functions.dart';
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
      // color: Constant.app_primary_color,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0, left: 10.0, right: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Clear Button
            SizedBox(
              height: this.opacity == 0.0 ? 40 : 0,
              child: ElevatedButton(
                onPressed: () async {
                  context.read<DuroodCountProvider>().resetDuroodCount();
                },
                child: Text(
                  'Clear Count',
                  style: TextStyle(
                    color: Constant.app_primary_contrast_color,
                    fontSize: Constant.h4,
                    fontWeight: Constant.app_font_weight,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Constant.app_primary_color,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        Constant.app_button_border_radius,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Save Button
            SizedBox(
              height: this.opacity == 0.0 ? 40 : 0,
              child: ElevatedButton(
                onPressed: () async {
                  // // Checking If Durood Count Is Going Null Or Not
                  if (context.read<DuroodCountProvider>().duroodCount > 0 &&
                      context.read<DuroodCountProvider>().duroodCount < 100) {
                    // Uploading Durood Count
                    await Functions().uploadDuroodCount(context);
                    context.read<DuroodCountProvider>().resetDuroodCount();
                  } else if (context.read<DuroodCountProvider>().duroodCount >=
                      100) {
                    Functions().showMyDialog(context, () {
                      Functions().uploadDuroodCount(context);
                    });
                  } else {
                    final snackBar = SnackBar(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 30.0,
                      ),
                      backgroundColor:
                          Constant.app_primary_contrast_color.withOpacity(0.7),
                      content: CustomSnackbar(
                        text: 'Please Add Durood Count',
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    context.read<DuroodCountProvider>().resetDuroodCount();
                  }

                  // // // Checking If Durood Count Is Going Null Or Not
                  // if (context.read<DuroodCountProvider>().duroodCount != 0) {
                  //   String result = await Functions().DuroodCountToFirebase(
                  //       context,
                  //       context.read<DuroodCountProvider>().duroodCount);
                  //
                  //   if (result.toString() ==
                  //       'DuroodCount Added Successfully.') {
                  //     final snackBar = SnackBar(
                  //       padding: EdgeInsets.symmetric(
                  //         horizontal: 10.0,
                  //         vertical: 30.0,
                  //       ),
                  //       backgroundColor: Constant.app_primary_contrast_color
                  //           .withOpacity(0.7),
                  //       content: CustomSnackbar(
                  //         text: 'Durood Count Updated Successfully',
                  //       ),
                  //     );
                  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  //   } else {
                  //     final snackBar = SnackBar(
                  //       padding: EdgeInsets.symmetric(
                  //         horizontal: 10.0,
                  //         vertical: 30.0,
                  //       ),
                  //       backgroundColor: Constant.app_primary_contrast_color
                  //           .withOpacity(0.7),
                  //       content: CustomSnackbar(
                  //         text: 'Durood Count Updation Unsuccessful',
                  //       ),
                  //     );
                  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  //   }
                  //
                  //   context.read<DuroodCountProvider>().resetDuroodCount();
                  // } else {
                  //   final snackBar = SnackBar(
                  //     padding: EdgeInsets.symmetric(
                  //       horizontal: 10.0,
                  //       vertical: 30.0,
                  //     ),
                  //     backgroundColor:
                  //         Constant.app_primary_contrast_color.withOpacity(0.7),
                  //     content: CustomSnackbar(
                  //       text: 'Please Add Durood Count',
                  //     ),
                  //   );
                  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  //   context.read<DuroodCountProvider>().resetDuroodCount();
                  // }
                },
                child: Text(
                  'Save Count',
                  style: TextStyle(
                    color: Constant.app_primary_contrast_color,
                    fontSize: Constant.h4,
                    fontWeight: Constant.app_font_weight,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Constant.app_primary_color,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        Constant.app_button_border_radius,
                      ),
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
