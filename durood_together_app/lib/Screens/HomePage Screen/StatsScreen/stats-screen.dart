import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/ReportScreen/RerpotHeader/reportheader.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Report Header Line
              ReportHeader(
                opacity: 1.0,
              ),

              // Calendar Heading
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Calendar Timeline',
                  style: TextStyle(
                    color: Constant.app_primary_color,
                    fontSize: Constant.h2,
                    fontWeight: Constant.app_font_weight,
                    letterSpacing: Constant.app_normal_letter_spacing,
                  ),
                ),
              ),

              // Calendar
              CalendarTimeline(
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
                monthColor: Constant.app_primary_color,
                dayColor: Constant.app_primary_contrast_color_light,
                dayNameColor:
                    Constant.app_primary_contrast_color.withOpacity(0.8),
                activeDayColor: Constant.app_primary_color,
                activeBackgroundDayColor:
                    Constant.app_primary_contrast_color_light,
                dotsColor: Constant.app_primary_contrast_color,
                selectableDayPredicate: (date) => date.day != 23,
                locale: 'en',
              ),

              SizedBox(height: 20),

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

              SizedBox(height: 150),

              Center(
                child: Text(
                  'Selected date is $_selectedDate',
                  style: TextStyle(color: Colors.white),
                ),
              ),

              // Text
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
