import 'package:durood_together_app/Core/DataViewModels/DuroodCountModel/duroodCountVM.dart';
import 'package:flutter/material.dart';
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
              color: Colors.teal[700].withOpacity(0.7),
              width: 2.0,
              style: BorderStyle.solid,
            ),
            bottom: BorderSide(
              color: Colors.teal[700].withOpacity(0.7),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Yesterday Count Tab
                    Container(
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
                                            .userYesterdayCount
                                            .isNaN ||
                                        context
                                                .watch<DuroodCountVM>()
                                                .userYesterdayCount ==
                                            0
                                    ? 0
                                    : context
                                        .watch<DuroodCountVM>()
                                        .userYesterdayCount,
                              ),
                              // Day
                              HomeCountTabsText(
                                text: 'Yesterday',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Today Count Tab
                    Container(
                      width: 130,
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Colors.teal[700].withOpacity(0.7),
                            width: 3.0,
                            style: BorderStyle.solid,
                          ),
                          right: BorderSide(
                            color: Colors.teal[700].withOpacity(0.7),
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
                                            .userTodayCount
                                            .isNaN ||
                                        context
                                                .watch<DuroodCountVM>()
                                                .userTodayCount ==
                                            0
                                    ? 0
                                    : context
                                        .watch<DuroodCountVM>()
                                        .userTodayCount,
                              ),
                              // Day
                              HomeCountTabsText(
                                text: 'Today',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // This Week Count Tab
                    Container(
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
                                            .userWeeklyCount
                                            .isNaN ||
                                        context
                                                .watch<DuroodCountVM>()
                                                .userWeeklyCount ==
                                            0
                                    ? 0
                                    : context
                                        .watch<DuroodCountVM>()
                                        .userWeeklyCount,
                              ),
                              // Day
                              HomeCountTabsText(
                                text: 'This Week',
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
