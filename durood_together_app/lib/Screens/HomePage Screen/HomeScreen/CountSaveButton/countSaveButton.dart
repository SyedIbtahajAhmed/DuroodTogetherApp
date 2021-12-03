import 'package:durood_together_app/Core/Providers/DuroodCountProvider/durood-count-provider.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/HomeScreen/SnackBar/custom-snackbar.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:durood_together_app/Shared/SharedFunctions/functions.dart';
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
              },
              child: Text(
                'Save Count',
                style: TextStyle(
                  color: Constant.app_primary_contrast_color,
                  fontSize: Constant.app_button_font_size,
                  fontWeight: Constant.app_font_weight,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Constant.app_primary_color),
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
        ),
      ),
    );
  }
}
