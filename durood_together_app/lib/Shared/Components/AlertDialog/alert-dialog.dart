import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class CustomAlertDialogBox extends StatelessWidget {
  final VoidCallback uploadDuroodCount;
  const CustomAlertDialogBox({
    Key key,
    this.uploadDuroodCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Warning',
        style: TextStyle(
          fontSize: 20.0,
          letterSpacing: 2.0,
          color: Constant.app_primary_contrast_color,
          fontWeight: Constant.app_font_weight,
        ),
      ),
      content: Text(
        'Do you wish to upload Durood Count?',
      ),
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
            'Upload',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Constant.app_primary_contrast_color,
            ),
          ),
          onPressed: () {
            // Durood Count Uploading
            this.uploadDuroodCount();
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
    );
  }
}
