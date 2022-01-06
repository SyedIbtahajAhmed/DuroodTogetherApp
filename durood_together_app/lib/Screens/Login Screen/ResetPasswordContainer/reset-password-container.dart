import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class ResetPasswordContainer extends StatelessWidget {
  final TextEditingController emailController;
  const ResetPasswordContainer({
    Key key,
    this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      child: Column(
        children: [
          // Email Container
          Container(
            child: TextFormField(
              controller: emailController,
              validator: (input) {
                if (input.isEmpty) return 'Please Enter Email.';
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Constant.app_primary_color,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: Constant.app_primary_contrast_color_light,
                  ),
                  borderRadius: BorderRadius.circular(
                      Constant.app_text_fields_border_radius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: Constant.app_primary_contrast_color_light,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                labelText: 'Enter Your Email',
                floatingLabelStyle: TextStyle(
                  color: Constant.app_primary_contrast_color,
                  fontSize: Constant.h4,
                ),
                prefixIcon: Icon(
                  Icons.email,
                  color: Constant.app_primary_contrast_color.withOpacity(0.8),
                ),
              ),
              // onSaved: (input) => _email = input,
            ),
          ),

          Container(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              'An email will be sent to the email address entered above to reset password.',
              style: TextStyle(
                color: Constant.app_primary_contrast_color,
                fontSize: Constant.h7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
