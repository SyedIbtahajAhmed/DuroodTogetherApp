import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class LeaderBoardRowEntry extends StatefulWidget {
  final int position;
  const LeaderBoardRowEntry({
    Key key,
    this.position,
  }) : super(key: key);

  @override
  _LeaderBoardRowEntryState createState() => _LeaderBoardRowEntryState();
}

class _LeaderBoardRowEntryState extends State<LeaderBoardRowEntry> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Row(
      children: [
        // Position Container
        Container(
          height: 70.0,
          width: 80.0,
          decoration: BoxDecoration(
            color: Constant.app_primary_contrast_color_light,
            borderRadius: BorderRadius.all(
              Radius.circular(Constant.app_cards_border_radius),
            ),
          ),
          child: Center(
            child: Text(
              this.widget.position.toString(),
              style: TextStyle(
                fontSize: Constant.h2,
                fontWeight: Constant.app_font_weight,
                color: Constant.app_primary_color,
              ),
            ),
          ),
        ),

        // Position Info Container
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            height: 70.0,
            width: screenSize.width < 350 ? 240 : 300,
            decoration: BoxDecoration(
              color: Constant.app_primary_contrast_color_light,
              borderRadius: BorderRadius.all(
                Radius.circular(Constant.app_cards_border_radius),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
