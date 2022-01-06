import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FieldWidget extends StatelessWidget {
  final String data;
  final Icon icon;
  const FieldWidget({Key key, this.data, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Constant.app_primary_color.withOpacity(0.4),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(Constant.app_text_fields_border_radius),
          borderSide: BorderSide.none,
        ),
        labelText: this.data.toString(),
        labelStyle: TextStyle(
          fontSize: Constant.h5,
          fontWeight: Constant.app_font_weight,
        ),
        prefixIcon: this.icon,
        enabled: false,
      ),
    );
  }
}
