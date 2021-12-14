import 'package:durood_together_app/Core/DataViewModels/DuroodCountModel/duroodCountVM.dart';
import 'package:durood_together_app/Core/DataViewModels/UserDuroodCountVM/user-durood-count-VM.dart';
import 'package:durood_together_app/Services/LocationService/location_service.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:durood_together_app/Shared/ScreensRoute/screens-route.dart';
import 'package:durood_together_app/Shared/SharedFunctions/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'TabButton/tabButton.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 2;
  PageController _pageController;

  void changePage(int page) {
    setState(() {
      _index = page;
      _pageController.animateToPage(
        _index,
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: _index);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Getting Location Of The User
    // Providers(context).duroodCountVM_provider;
    // final userLocation = Provider.of<UserLocation>(context);
    final dynamic duroodCount = Provider.of<DuroodCountVM>(context);
    final dynamic userDuroodCount = Provider.of<UserDuroodCountVM>(context);
    final firebaseUser = Provider.of<User>(context);
    String country;
    String city;

    country = context.read<LocationService>().userAddress.length > 0
        ? context.read<LocationService>().userAddress[0].country.toString()
        : '';
    city = context.read<LocationService>().userAddress.length > 0
        ? context.read<LocationService>().userAddress[0].locality.toString()
        : '';

    return FutureBuilder(
      future: Future.wait(
        [
          Functions().fetchDuroodCountFromProvider(context, duroodCount,
              userDuroodCount, country, city, firebaseUser.uid),
          // Functions().getCurrentMonthData(context, country, city),
          // Functions().getUserMonthlyData(context, firebaseUser.uid),
          // Functions().getUserWeeklyCount(firebaseUser.uid, duroodCount),
          // Functions().getUserTodayCount(firebaseUser.uid, userDuroodCount),
          // Functions().getUserYesterdayCount(firebaseUser.uid, duroodCount),
          // Functions().getPreviousMonthDuroodCountData(context),
        ],
      ),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          // Setting Durood Data
          // context.watch<DuroodCountVM>().setAttributes(
          //       duroodCountData: snapshot.data[0],
          //       // currentMonthData: snapshot.data[1], // Current Month Data
          //       userMonthlyData: snapshot.data[1], // User Monthly Data
          //       // userWeeklyCount: snapshot.data[2], // User Weekly Count
          //       // userTodayCount: snapshot.data[3], // User Today Count
          //       // userYesterdayCount: snapshot.data[4], // User Yesterday Count
          //       prevMonthData: snapshot.data[2], // Previous Month Data
          //     );

          // Functions().getPreviousMonthDuroodCountData(duroodCount);

          // print(context.read<DuroodCountVM>().DuroodCountsData);

          return Scaffold(
            backgroundColor: Constant.app_primary_contrast_color,
            body: Column(
              children: <Widget>[
                // Going To Change Tabs Here
                Expanded(
                  child: PageView(
                    onPageChanged: (int page) {
                      setState(() {
                        _index = page;
                      });
                    },
                    controller: _pageController,
                    children: <Widget>[
                      for (int i = 0; i < ScreensRoute.Screens.length; i++)
                        Container(
                          child: ScreensRoute.Screens[ScreensRoute.Screens.keys
                                  .elementAt(i)
                                  .toString()]
                              .elementAt(0), // Widgets Of All Screens
                        ),
                    ],
                  ),
                ),

                // Whole Bottom Tab Bar
                Padding(
                  padding: EdgeInsets.only(
                    // top: 10.0,
                    bottom: MediaQuery.of(context).padding.bottom,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Constant.app_primary_color,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          Constant.app_bottom_bar_border_radius,
                        ),
                        topRight: Radius.circular(
                          Constant.app_bottom_bar_border_radius,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        // Home Button TAB
                        for (int i = 0; i < ScreensRoute.Screens.length; i++)
                          Container(
                            child: TabButton(
                              index: ScreensRoute.Screens[ScreensRoute
                                      .Screens.keys
                                      .elementAt(i)
                                      .toString()]
                                  .elementAt(1), // Indexes Of All Screens,
                              title: ScreensRoute.Screens.keys
                                  .elementAt(i)
                                  .toString(),
                              icon: ScreensRoute.Screens[ScreensRoute
                                      .Screens.keys
                                      .elementAt(i)
                                      .toString()]
                                  .elementAt(2), // Icons Of All Screens,,
                              selectedPage: _index,
                              onPressed: () {
                                changePage(i);
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          return Scaffold(
            backgroundColor: Constant.app_primary_color,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    child: CircularProgressIndicator(
                      color: Constant.app_primary_contrast_color,
                    ),
                  ),
                ),
                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
              ],
            ),
          );
        }
      },
    );
  }
}
