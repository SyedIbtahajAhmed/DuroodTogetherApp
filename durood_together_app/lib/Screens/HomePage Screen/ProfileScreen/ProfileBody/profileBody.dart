import 'package:durood_together_app/Core/Providers/DuroodCountProvider/durood-count-provider.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/HomeScreen/SnackBar/custom-snackbar.dart';
import 'package:durood_together_app/Services/LocationService/location_service.dart';
import 'package:durood_together_app/Shared/Components/CustomExpansionTileWidget/CustomListTileWidget/custom-list-tile-widget.dart';
import 'package:durood_together_app/Shared/Components/CustomExpansionTileWidget/custom-expansion-tile-widget.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'FieldWidget/fieldWidget.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key key}) : super(key: key);

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final dynamic firebaseUser = Provider.of<User>(context);
    // final userLocation = Provider.of<UserLocation>(context);

    return Container(
      width: screenSize.width < 350 ? 330 : 380,
      // height: screenSize.height / 4.5 * 2,
      decoration: BoxDecoration(
        color: Constant.app_primary_contrast_color_light,
        borderRadius: BorderRadius.all(
          Radius.circular(Constant.app_cards_border_radius),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.teal.withOpacity(0.5),
        //     spreadRadius: 5,
        //     blurRadius: 20,
        //     offset: Offset(0, 3), // changes position of shadow
        //   ),
        // ],
      ),
      child: Padding(
        // Top Padding is not given here
        // As it is given in individual text field widget
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
        child: IntrinsicHeight(
          child: Container(
            child: Column(
              children: <Widget>[
                // Custom Profile Expansion tile
                CustomExpansionTileWidget(
                  title: 'Profile',
                  initiallyExpanded: true,
                  insideWidgets: [
                    // Name Widget
                    FieldWidget(
                      data: (firebaseUser.displayName != null)
                          ? firebaseUser.displayName
                          : "Name Not Available",
                      icon: Icon(Icons.account_box),
                    ),
                    // Email Widget
                    FieldWidget(
                      data: (firebaseUser.email != null)
                          ? firebaseUser.email
                          : "Email Not Available",
                      icon: Icon(Icons.email),
                    ),
                    // Country Widget
                    FieldWidget(
                      data: (context
                                      .watch<LocationService>()
                                      .userAddress[0]
                                      .country
                                      .toString() !=
                                  null ||
                              context
                                      .watch<LocationService>()
                                      .userAddress[0]
                                      .country
                                      .toString() !=
                                  "")
                          ? context
                              .watch<LocationService>()
                              .userAddress[0]
                              .country
                              .toString()
                          : "Country Not Available",
                      icon: Icon(Icons.home_filled),
                    ),
                    // City Widget
                    FieldWidget(
                      data: (context
                                      .watch<LocationService>()
                                      .userAddress[0]
                                      .locality
                                      .toString() !=
                                  null ||
                              context
                                      .watch<LocationService>()
                                      .userAddress[0]
                                      .locality
                                      .toString() !=
                                  "")
                          ? context
                              .watch<LocationService>()
                              .userAddress[0]
                              .locality
                              .toString()
                          : "City Not Available",
                      icon: Icon(Icons.home),
                    ),
                  ],
                ),

                // Custom Expansion Extra Tiles
                CustomExpansionTileWidget(
                  title: "Durood Settings",
                  initiallyExpanded: false,
                  insideWidgets: [
                    // Durood Lists
                    CustomExpansionTileWidget(
                      title: 'Select Durood',
                      initiallyExpanded: false,
                      insideWidgets: [
                        for (int i = 0; i < Constant().duroodList.length; i++)
                          CustomListTileWidget(
                            onPressed: () async {
                              await context
                                  .read<DuroodCountProvider>()
                                  .changeDurood(Constant()
                                      .duroodList
                                      .keys
                                      .elementAt(i)
                                      .toString());

                              final snackBar = SnackBar(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                  vertical: 30.0,
                                ),
                                backgroundColor: Constant
                                    .app_primary_contrast_color
                                    .withOpacity(0.7),
                                content: CustomSnackbar(
                                  text: 'Durood Shareef Updated',
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            text: Constant()
                                .duroodList
                                .keys
                                .elementAt(i)
                                .toString(),
                          ),
                      ],
                    ),
                  ],
                ),

                CustomExpansionTileWidget(
                  title: "Other Settings",
                  initiallyExpanded: false,
                  insideWidgets: [
                    CustomListTileWidget(text: "Item 1"),
                    CustomListTileWidget(text: "Item 2"),
                    CustomListTileWidget(text: "Item 3"),
                    CustomListTileWidget(text: "Item 4"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
