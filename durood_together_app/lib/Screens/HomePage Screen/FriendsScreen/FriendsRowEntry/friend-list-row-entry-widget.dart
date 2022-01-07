import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class FriendListRowEntryWidget extends StatelessWidget {
  final int position;
  final String name;
  const FriendListRowEntryWidget({
    Key key,
    this.name,
    this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Position Container
          Container(
            height: 70.0,
            width: 60.0,
            decoration: BoxDecoration(
              color: Constant.app_primary_contrast_color_light,
              borderRadius: BorderRadius.all(
                Radius.circular(Constant.app_cards_border_radius),
              ),
              border: Border.all(
                color: Constant.app_primary_color.withOpacity(0.7),
                width: 2.0,
              ),
            ),
            child: Center(
              child: Text(
                this.position.toString(),
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
              width: screenSize.width < 350 ? 250 : 310,
              decoration: BoxDecoration(
                color: Constant.app_primary_contrast_color_light.withAlpha(120),
                borderRadius: BorderRadius.all(
                  Radius.circular(Constant.app_cards_border_radius),
                ),
                border: Border.all(
                  color: Constant.app_primary_color.withOpacity(0.7),
                  width: 1.5,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Name
                    Text(
                      this.name,
                      style: TextStyle(
                        color: Constant.app_primary_color,
                        fontSize: Constant.h5,
                        fontWeight: Constant.app_normal_font_weight,
                        letterSpacing: Constant.app_normal_letter_spacing,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
