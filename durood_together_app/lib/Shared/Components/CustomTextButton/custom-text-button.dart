import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final double opacity;
  final String buttonText;
  final VoidCallback onPressed;
  const CustomTextButton({
    Key key,
    this.opacity,
    this.buttonText,
    this.onPressed,
  }) : super(key: key);

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
                this.onPressed();
              },
              child: Text(
                this.buttonText,
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
