import 'package:flutter/material.dart';

class ReportHeader extends StatelessWidget {
  final double opacity;
  const ReportHeader({Key key, this.opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInCubic,
      width: screenSize.width,
      height: this.opacity == 1.0 ? 80 : 0,
      child: Container(
        padding: const EdgeInsets.only(top: 30.0),
        child: Center(
          child: Text(
            "BE A PART OF THE BARAKAH CIRCLE OF DUROOD SHAREEF",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
