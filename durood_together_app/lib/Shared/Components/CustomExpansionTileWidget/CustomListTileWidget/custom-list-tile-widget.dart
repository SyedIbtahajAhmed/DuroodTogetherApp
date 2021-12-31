import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class CustomListTileWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomListTileWidget({
    Key key,
    this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Constant.app_primary_color.withOpacity(0.4),
        borderRadius: BorderRadius.all(
          Radius.circular(Constant.app_text_fields_border_radius),
        ),
      ),
      child: ListTile(
        onTap: () {
          this.onPressed();
        },
        title: Text(
          this.text,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: Constant.h5,
            fontWeight: Constant.app_font_weight,
          ),
        ),
      ),
    );
  }
}
