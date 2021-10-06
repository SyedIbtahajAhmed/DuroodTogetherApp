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
          //     ? Colors.teal[900]
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
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Icon(
                  widget.icon,
                  color: widget.index == widget.selectedPage
                      ? Colors.teal[900]
                      : Colors.teal[900],
                  size: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: widget.index == widget.selectedPage
                      ? Text(
                          widget.title,
                          style: TextStyle(
                            color: Colors.teal[900],
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
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
