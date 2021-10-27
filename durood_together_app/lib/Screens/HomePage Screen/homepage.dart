import 'package:durood_together_app/Core/DataViewModels/DuroodCountModel/duroodCountVM.dart';
import 'package:durood_together_app/Shared/SharedFunctions/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'HomeScreen/home.dart';
import 'ProfileScreen/profile.dart';
import 'ReportScreen/report.dart';
import 'TabButton/tabButton.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
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
    _pageController = PageController();
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
    final firebaseUser = Provider.of<User>(context);

    return FutureBuilder(
      future: Future.wait(
        [
          Functions().getTopCountry(duroodCount),
          Functions().getTopCity(duroodCount),
          Functions().getGlobalCount(duroodCount),
          Functions().getTopFiveCountries(duroodCount),
          Functions().getTopFiveCities(duroodCount),
          Functions().getUserMonthlyData(firebaseUser.uid, duroodCount),
        ],
      ),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          // Setting Durood Data
          context.watch<DuroodCountVM>().setAttributes(
                topCountry: snapshot.data[0], // Top Country
                topCity: snapshot.data[1], // Top City
                globalCount: snapshot.data[2], // Global Count
                topFiveCountries: snapshot.data[3], // Top Five Countries
                topFiveCities: snapshot.data[4], // Top Five Cities
                userMonthlyData: snapshot.data[5], // User Monthly Data
              );

          // print(context.watch<DuroodCountVM>().topCountry.toString());

          return Scaffold(
            backgroundColor: Colors.teal[900],
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
                      Container(
                        child: Home(),
                      ),
                      Container(
                        child: Report(),
                      ),
                      Container(
                        child: Profile(),
                      ),
                    ],
                  ),
                ),

                // Whole Bottom Tab Bar
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: MediaQuery.of(context).padding.bottom,
                  ),
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        // Home Button TAB
                        Container(
                          child: TabButton(
                            index: 0,
                            title: 'Home',
                            icon: Icons.home_outlined,
                            selectedPage: _index,
                            onPressed: () {
                              changePage(0);
                            },
                          ),
                        ),

                        // Spacer(),

                        // Report Button TAB
                        Container(
                          child: TabButton(
                            index: 1,
                            title: 'Report',
                            icon: Icons.report_gmailerrorred_outlined,
                            selectedPage: _index,
                            onPressed: () {
                              changePage(1);
                            },
                          ),
                        ),

                        // Spacer(),

                        // Profile Button TAB
                        Container(
                          child: TabButton(
                            index: 2,
                            title: 'Profile',
                            icon: Icons.account_circle_outlined,
                            selectedPage: _index,
                            onPressed: () {
                              changePage(2);
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
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    child: CircularProgressIndicator(
                      color: Colors.teal[900],
                    ),
                  ),
                ),
              ],
            ),
          );
          // return AnimatedContainer(
          //   duration: Duration(milliseconds: 500),
          //   child: CountTextConainer(
          //     text: "Please Wait!",
          //   ),
          // );
        }
      },
    );
  }
}
