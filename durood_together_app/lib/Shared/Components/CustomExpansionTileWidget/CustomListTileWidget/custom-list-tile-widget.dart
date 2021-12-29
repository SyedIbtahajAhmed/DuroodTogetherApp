import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class CustomListTileWidget extends StatelessWidget {
  final String text;
  const CustomListTileWidget({
    Key key,
    this.text,
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
        title: Text(this.text),
      ),
    );
  }
}
