import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/ReportScreen/RerpotHeader/reportheader.dart';
import 'package:durood_together_app/Shared/Components/CircularPercentageIndicator/circular-percentage-indicator.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key key}) : super(key: key);

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Report Header Line
              ReportHeader(
                opacity: 1.0,
              ),

              Container(
                width: screenSize.width < 350 ? 330 : 380,
                decoration: BoxDecoration(
                  // color: Constant.app_primary_color,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.3,
                      1.0,
                    ],
                    colors: [
                      Constant.app_primary_color.withAlpha(200),
                      Constant.app_primary_contrast_color,
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(Constant.app_cards_border_radius),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Constant.app_primary_contrast_color.withOpacity(0.1),
                      spreadRadius: 4,
                      blurRadius: 5,
                      offset: Offset(3, 5), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Calendar Heading
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                      child: Text(
                        'Calendar Timeline',
                        style: TextStyle(
                          color: Constant.app_primary_contrast_color,
                          fontSize: Constant.h2,
                          fontWeight: Constant.app_font_weight,
                          letterSpacing: Constant.app_normal_letter_spacing,
                        ),
                      ),
                    ),

                    // Calendar
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10.0,
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: CalendarTimeline(
                        showYears: true,
                        initialDate: _selectedDate,
                        firstDate: DateTime.now().subtract(
                          Duration(
                            days: 1460,
                          ),
                        ),
                        lastDate: DateTime.now().add(
                          Duration(
                            days: 1825,
                          ),
                        ),
                        onDateSelected: (date) {
                          setState(() {
                            _selectedDate = date;
                          });
                        },
                        leftMargin: screenSize.width / 2 - 30.0,
                        monthColor: Constant.app_primary_contrast_color,
                        dayColor: Constant.app_primary_contrast_color
                            .withOpacity(0.6),
                        dayNameColor:
                            Constant.app_primary_color.withOpacity(0.8),
                        activeDayColor:
                            Constant.app_primary_contrast_color_light,
                        activeBackgroundDayColor:
                            Constant.app_primary_contrast_color,
                        dotsColor: Constant.app_primary_color,
                        selectableDayPredicate: (date) => date.day != 23,
                        locale: 'en',
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              // Resetting Button
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInExpo,
                height: Constant.app_button_height,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(
                            () => _resetSelectedDate(),
                          );
                        },
                        child: Text(
                          'Reset Calendar',
                          style: TextStyle(
                            color: Constant.app_primary_contrast_color,
                            fontSize: Constant.app_button_font_size,
                            fontWeight: Constant.app_font_weight,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Constant.app_primary_color),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                Constant.app_button_border_radius,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // SizedBox(height: 50.0),
              //
              // Center(
              //   child: Text(
              //     'Selected date is $_selectedDate',
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),

              // Text
              Container(
                child: Text(
                  'Statistics',
                  style: TextStyle(
                    color: Constant.app_primary_color,
                    fontSize: Constant.h1,
                    fontWeight: Constant.app_font_weight,
                    letterSpacing: Constant.app_max_letter_spacing,
                  ),
                ),
              ),

              Center(
                child: Container(
                  child: // First Indicator
                      CustomCircularPercentageIndicator(
                    radiusData: screenSize.width / 2 * 1.5,
                    percentageData: 0.5,
                    insideText: '0.5%',
                    outsideText: 'My Durood Count',
                    lineWidth: 20.0,
                    shouldAnimate: true,
                    progressColor: Constant.app_primary_contrast_color_light,
                    backgroundColor: Constant.app_primary_color,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Second Indicator
                  CustomCircularPercentageIndicator(
                    radiusData: 150.0,
                    percentageData: 0.4,
                    insideText: '0.4%',
                    outsideText: 'City Count',
                    lineWidth: 20.0,
                    shouldAnimate: true,
                    progressColor: Constant.app_primary_contrast_color_light,
                    backgroundColor: Constant.app_primary_color,
                  ),

                  // Fourth Indicator
                  CustomCircularPercentageIndicator(
                    radiusData: 150.0,
                    percentageData: 0.7,
                    insideText: '0.7%',
                    outsideText: 'Country Count',
                    lineWidth: 20.0,
                    shouldAnimate: true,
                    progressColor: Constant.app_primary_contrast_color_light,
                    backgroundColor: Constant.app_primary_color,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
