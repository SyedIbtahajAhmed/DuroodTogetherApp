import 'package:durood_together_app/Core/DataViewModels/DuroodCountModel/duroodCountVM.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:durood_together_app/Shared/SharedFunctions/functions.dart';
import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';
import 'package:provider/src/provider.dart';

import 'HomeCountTabsText/homeCountTabsText.dart';

class HomeCountTabs extends StatefulWidget {
  final double opacity;
  const HomeCountTabs({Key key, this.opacity}) : super(key: key);

  @override
  _HomeCountTabsState createState() => _HomeCountTabsState();
}

class _HomeCountTabsState extends State<HomeCountTabs> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        // height: widget.opacity == 1.0 ? 80 : 0.0,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Constant.app_primary_contrast_color_light.withOpacity(0.7),
              width: 2.0,
              style: BorderStyle.solid,
            ),
            bottom: BorderSide(
              color: Constant.app_primary_contrast_color_light.withOpacity(0.7),
              width: 2.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: widget.opacity == 1.0
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Yesterday Count Tab
                    Container(
                      width: 125.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              // Today Count
                              HomeCountTabsText(
                                count: context
                                                .watch<DuroodCountVM>()
                                                .myCountryCount ==
                                            null ||
                                        context
                                                .watch<DuroodCountVM>()
                                                .myCountryCount ==
                                            0
                                    ? 0.toString()
                                    : Functions().ConvertNumber(Numeral(
                                        context
                                            .watch<DuroodCountVM>()
                                            .myCityCount,
                                      ).value()),
                              ),
                              // Day
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: HomeCountTabsText(
                                  text: 'My City',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Today Count Tab
                    Expanded(
                      child: Container(
                        // width: 130,
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Constant.app_primary_contrast_color_light
                                  .withOpacity(0.7),
                              width: 3.0,
                              style: BorderStyle.solid,
                            ),
                            right: BorderSide(
                              color: Constant.app_primary_contrast_color_light
                                  .withOpacity(0.7),
                              width: 3.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30.0,
                          ),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                // Count
                                HomeCountTabsText(
                                  count: context
                                                  .watch<DuroodCountVM>()
                                                  .userTodayCount ==
                                              null ||
                                          context
                                                  .watch<DuroodCountVM>()
                                                  .userTodayCount ==
                                              0
                                      ? 0.toString()
                                      : context
                                          .watch<DuroodCountVM>()
                                          .userTodayCount
                                          .toString(),
                                ),
                                // Day
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: HomeCountTabsText(
                                    text: 'Mine',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    // This Week Count Tab
                    Container(
                      width: 125.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              // Count
                              HomeCountTabsText(
                                count: context
                                                .watch<DuroodCountVM>()
                                                .myCountryCount ==
                                            null ||
                                        context
                                                .watch<DuroodCountVM>()
                                                .myCountryCount ==
                                            0
                                    ? 0.toString()
                                    : Functions().ConvertNumber(Numeral(
                                        context
                                            .watch<DuroodCountVM>()
                                            .myCountryCount,
                                      ).value()),
                              ),
                              // Day
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: HomeCountTabsText(
                                  text: 'My Country',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
      ),
    );
  }
}
