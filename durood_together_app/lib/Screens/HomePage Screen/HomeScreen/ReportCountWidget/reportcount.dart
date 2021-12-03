import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

import 'InfoContainer/InfoContainer.dart';

class ReportCount extends StatelessWidget {
  bool expanded;
  ReportCount({
    Key key,
    this.expanded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final GlobalKey _widgetKey = GlobalKey();

    // final RenderBox renderBox =
    //     _widgetKey.currentContext?.findRenderObject() as RenderBox;
    //
    // print(renderBox.size);

    // final Size widgetSize =
    //     renderBox.size; // or _widgetKey.currentContext?.size

    Size screenSize = MediaQuery.of(context).size;
    return IntrinsicHeight(
      child: !this.expanded
          ? AnimatedContainer(
              // key: _widgetKey,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInExpo,
              // height: this.expanded ? 0.0 : screenSize.height * 0.25,
              // padding: EdgeInsets.symmetric(horizontal: 20.0),
              width: screenSize.width < 350 ? 330 : 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(Constant.app_cards_border_radius),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Constant.app_primary_contrast_color.withOpacity(0.1),
                    spreadRadius: 4,
                    blurRadius: 5,
                    offset: Offset(3, 5), // changes position of shadow
                  ),
                ],
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Constant.app_primary_color.withOpacity(0.3),
                    BlendMode.dstATop,
                  ),
                  image: AssetImage("images/ReportCount_Pic.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: InfoContainer(),
            )
          : Container(),
    );
  }
}
