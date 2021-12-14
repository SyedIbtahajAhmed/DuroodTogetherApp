import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class TabButton extends StatefulWidget {
  final int index;
  final String title;
  final IconData icon;
  final int selectedPage;
  final Function onPressed;
  const TabButton(
      {key,
      this.index,
      this.title,
      this.icon,
      this.selectedPage,
      this.onPressed})
      : super(key: key);

  @override
  _TabButtonState createState() => _TabButtonState();
}

class _TabButtonState extends State<TabButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          // color: widget.index == widget.selectedPage
          //     ? Constant.app_primary_contrast_color
          //     : Colors.transparent,
          borderRadius: widget.index == widget.selectedPage
              ? BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
              : BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Icon(
                  widget.icon,
                  color: widget.index == widget.selectedPage
                      ? Constant.app_primary_contrast_color
                      : Constant.app_primary_contrast_color,
                  size: Constant.app_bottom_bar_icon_size,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: widget.index == widget.selectedPage
                      ? Text(
                          widget.title,
                          style: TextStyle(
                            color: Constant.app_primary_contrast_color,
                            fontSize: Constant.h4,
                            fontWeight: Constant.app_font_weight,
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
