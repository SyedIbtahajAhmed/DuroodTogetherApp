import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 1500),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeInOutCubicEmphasized,
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
                  "Setting",
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
      builder: (context, headerValue, Widget child) {
        return Container(
          width: double.infinity,
          height: screenSize.height * 0.31 * headerValue,
          decoration: BoxDecoration(
            color: Constant.app_primary_contrast_color_light,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Constant.app_headers_border_radius),
              bottomRight: Radius.circular(Constant.app_headers_border_radius),
            ),
          ),
          child: Transform.translate(
            offset: Offset(0.0, 10 * headerValue),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 2000),
              opacity: 1.0 * headerValue,
              child: child,
            ),
          ),
        );
      },
    );

    return Container(
      width: screenSize.width,
      height: screenSize.height * 0.31,
      decoration: BoxDecoration(
        color: Constant.app_primary_contrast_color_light,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Constant.app_headers_border_radius),
          bottomRight: Radius.circular(Constant.app_headers_border_radius),
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
