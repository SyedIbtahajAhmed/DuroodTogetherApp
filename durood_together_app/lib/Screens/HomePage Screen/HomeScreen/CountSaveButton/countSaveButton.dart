import 'package:durood_together_app/Core/Providers/DuroodCountProvider/durood-count-provider.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/HomeScreen/SnackBar/custom-snackbar.dart';
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
                String result = await Functions().DuroodCountToFirebase(context,
                    context.read<DuroodCountProvider>().duroodCountField);

                if (result.toString() == 'DuroodCount Added Successfully.') {
                  final snackBar = SnackBar(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 30.0,
                    ),
                    backgroundColor: Colors.teal[900].withOpacity(0.7),
                    content: CustomSnackbar(
                      text: 'Durood Count Updated Successfully',
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  final snackBar = SnackBar(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 30.0,
                    ),
                    backgroundColor: Colors.teal[900].withOpacity(0.7),
                    content: CustomSnackbar(
                      text: 'Durood Count Updation Unsuccessful',
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

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
