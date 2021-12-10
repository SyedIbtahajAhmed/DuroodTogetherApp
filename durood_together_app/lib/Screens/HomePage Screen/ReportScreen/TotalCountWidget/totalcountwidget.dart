import 'dart:collection';

import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:durood_together_app/Shared/SharedFunctions/functions.dart';
import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';

class TotalCountWidget extends StatelessWidget {
  String tableHeader;
  Map<String, dynamic> data;
  TotalCountWidget({
    Key key,
    this.tableHeader,
    this.data,
  }) : super(key: key) {
    // if (this.tableHeader != '' || this.tableHeader != null) {
    //   // print(Functions().SortDictionary(this.data));
    // }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    // print('data Got :' + this.data.toString());
    SplayTreeMap<dynamic, dynamic> sorted;

    // Sorting Dictionary
    sorted = Functions().SortDictionary(this.data);

    return IntrinsicHeight(
      child: Container(
        width: screenSize.width < 350 ? 330 : 380,
        // height: (screenSize.height / 2) * 0.88,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
        decoration: BoxDecoration(
          color: Constant.app_primary_contrast_color_light,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(screenSize.width / 20),
            topRight: Radius.circular(screenSize.width / 20),
            bottomLeft: Radius.circular(screenSize.width / 20),
            bottomRight: Radius.circular(screenSize.width / 20),
          ),
          boxShadow: [
            BoxShadow(
              color: Constant.app_primary_contrast_color.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(3, 5), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Card Header
            this.tableHeader == '' || this.tableHeader == null
                ? Container()
                : Container(
                    width: screenSize.width,
                    padding: const EdgeInsets.only(bottom: 20.0),
                    margin: const EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Constant.app_primary_color.withOpacity(0.3),
                            width: 2),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        this.tableHeader,
                        style: TextStyle(
                          color: Constant.app_primary_color,
                          fontWeight: Constant.app_font_weight,
                          fontSize: Constant.h4,
                          letterSpacing: Constant.app_max_letter_spacing,
                        ),
                      ),
                    ),
                  ),

            for (var item = 0; item < sorted.keys.length; item++)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    this.tableHeader == '' || this.tableHeader == null
                        ? Container(
                            child: Text(
                              // data.keys.elementAt(item),
                              data.keys.length > 0
                                  ? Functions().getUserDuroodMonthDate(
                                      data.keys.elementAt(item).toString())
                                  : "",
                              style: TextStyle(
                                color: Constant.app_primary_color,
                                fontSize: Constant.h4,
                              ),
                            ),
                          )
                        : Container(
                            child: Text(
                              sorted.keys.length > 0
                                  ? sorted.keys.elementAt(item).toString()
                                  : '',
                              style: TextStyle(
                                color: Constant.app_primary_color,
                                fontSize: Constant.h4,
                              ),
                            ),
                          ),
                    Container(
                      child: Text(
                        sorted.values.length > 0
                            ? Functions().ConvertNumber(
                                Numeral(sorted.values.elementAt(item)).value())
                            : '0',
                        style: TextStyle(
                          color: Constant.app_primary_color,
                          fontSize: Constant.h4,
                        ),
                      ),
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
