import 'package:durood_together_app/Screens/HomePage%20Screen/ReportScreen/ReportScreenInfoContainer/ReportInfoContainer/report-info-container.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class ReportScreenInfoContainer extends StatelessWidget {
  const ReportScreenInfoContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return IntrinsicHeight(
      child: Container(
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
        child: ReportInfoContainer(),
      ),
    );
  }
}
