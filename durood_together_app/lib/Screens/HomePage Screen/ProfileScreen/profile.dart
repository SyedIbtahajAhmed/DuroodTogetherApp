import 'package:durood_together_app/Authentication/Authentication.dart';
import 'package:durood_together_app/Core/DataViewModels/DuroodCountModel/duroodCountVM.dart';
import 'package:durood_together_app/Core/Providers/DuroodCountProvider/durood-count-provider.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ProfileBody/profileBody.dart';
import 'ProfileHeader/profileheader.dart';

class Profile extends StatelessWidget {
  const Profile({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            // Profile Header Widget
            ProfileHeader(),

            // Profile Container
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.06),
                  child: Column(
                    children: [
                      ProfileBody(),
                      TweenAnimationBuilder<double>(
                        tween: Tween(begin: 1.0, end: 0.0),
                        duration: Duration(milliseconds: 1500),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<DuroodCountVM>().resetAttributes();
                              context
                                  .read<DuroodCountProvider>()
                                  .resetDuroodCount();
                              context.read<Authentication>().signOut();
                            },
                            child: Text(
                              'SIGNOUT',
                              style: TextStyle(
                                fontSize: Constant.app_button_font_size,
                                fontWeight: Constant.app_font_weight,
                                color: Constant.app_primary_contrast_color,
                                letterSpacing:
                                    Constant.app_normal_letter_spacing,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Constant.app_primary_color),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                  Constant.app_button_border_radius,
                                )),
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                Size(Constant.app_button_min_width,
                                    Constant.app_button_height),
                              ),
                              maximumSize: MaterialStateProperty.all<Size>(
                                Size(Constant.app_button_max_width,
                                    Constant.app_button_height),
                              ),
                            ),
                          ),
                        ),
                        builder: (context, value, Widget child) {
                          return Transform.translate(
                            offset: Offset(0.0, 50.0 * value),
                            child: child,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
