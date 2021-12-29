import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class CustomExpansionTileWidget extends StatelessWidget {
  final String title;
  final List<Widget> insideWidgets;
  final bool initiallyExpanded;
  const CustomExpansionTileWidget({
    Key key,
    this.title,
    this.initiallyExpanded,
    this.insideWidgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Constant.app_primary_color.withOpacity(0.4),
          borderRadius: BorderRadius.all(
            Radius.circular(Constant.app_text_fields_border_radius),
          ),
        ),
        child: Column(
          children: <Widget>[
            ExpansionTile(
              initiallyExpanded: initiallyExpanded,
              title: Text(
                this.title,
                style: TextStyle(
                  color: Constant.app_primary_contrast_color,
                  fontSize: Constant.h4,
                  fontWeight: Constant.app_font_weight,
                ),
              ),
              childrenPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
              iconColor: Constant.app_primary_contrast_color_light,
              collapsedIconColor: Constant.app_primary_contrast_color,
              children: <Widget>[
                for (int i = 0; i < this.insideWidgets.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: this.insideWidgets[i],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
