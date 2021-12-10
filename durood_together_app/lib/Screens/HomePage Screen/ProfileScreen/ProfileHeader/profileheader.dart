import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: screenSize.height * 0.31,
      decoration: BoxDecoration(
        color: Constant.app_primary_contrast_color_light,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(Constant.app_cards_border_radius + 20.0),
          right: Radius.circular(Constant.app_cards_border_radius + 20.0),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.teal.withOpacity(1),
        //     spreadRadius: 5,
        //     blurRadius: 20,
        //     offset: Offset(0, 3), // changes position of shadow
        //   ),
        // ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: screenSize.height * 0.1),
            child: Container(
              child: Center(
                child: Text(
                  "BE A PART OF THE BARAKAH CIRCLE OF DUROOD SHAREEF",
                  style: TextStyle(
                    color: Constant.app_primary_color,
                    fontSize: Constant.h7,
                    fontWeight: Constant.app_font_weight,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Container(
              child: Center(
                child: Text(
                  "Your Profile",
                  style: TextStyle(
                    color: Constant.app_primary_color,
                    fontSize: Constant.h2,
                    fontWeight: Constant.app_font_weight,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
