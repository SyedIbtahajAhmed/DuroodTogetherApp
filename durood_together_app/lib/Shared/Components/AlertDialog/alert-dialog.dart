import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class CustomAlertDialogBox extends StatelessWidget {
  final String headerText;
  final Widget content;
  final String proceedButtonText;
  final VoidCallback dialogCallback;
  const CustomAlertDialogBox({
    Key key,
    this.headerText,
    this.content,
    this.proceedButtonText,
    this.dialogCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10,
      title: Text(
        this.headerText,
        style: TextStyle(
          fontSize: 20.0,
          letterSpacing: 2.0,
          color: Constant.app_primary_contrast_color,
          fontWeight: Constant.app_font_weight,
        ),
      ),
      content: this.content,
      actions: <Widget>[
        // Deny Upload Button
        TextButton(
          child: Text(
            'Deny',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Constant.app_primary_contrast_color,
            ),
          ),
          onPressed: () {
            // Closing The Alert Dialog
            Navigator.of(context).pop();
          },
        ),

        // Confirm Upload Button
        TextButton(
          child: Text(
            this.proceedButtonText,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Constant.app_primary_contrast_color,
            ),
          ),
          onPressed: () {
            // Durood Count Uploading
            this.dialogCallback();
            // Closing The Alert Dialog
            Navigator.of(context).pop();
          },
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      scrollable: true,
    );
  }
}
