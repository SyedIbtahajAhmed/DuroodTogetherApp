import 'package:durood_together_app/Core/DataViewModels/UserViewModel/user-view-model.dart';
import 'package:durood_together_app/Shared/Components/CustomTextButton/custom-text-button.dart';
import 'package:durood_together_app/Shared/Components/CustomTextField/custom-text-field.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:durood_together_app/Shared/SharedFunctions/functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'FriendsRowEntry/friend-list-row-entry-widget.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({Key key}) : super(key: key);

  @override
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  dynamic result;

  TextEditingController _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dynamic userProvider = Provider.of<UserViewModel>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          // Count Field Widget
          TweenAnimationBuilder(
              tween: Tween(begin: 1.0, end: 0.0),
              duration: Duration(milliseconds: 1000),
              builder: (context, value, _) {
                return Transform.translate(
                  offset: Offset(0.0, 150.0 * value),
                  child: CustomTextField(
                    opacity: 1.0,
                    labelText: 'Enter Name',
                    textEditingController: _searchTextController,
                  ),
                );
              }),
          TweenAnimationBuilder(
              tween: Tween(begin: 1.0, end: 0.0),
              duration: Duration(milliseconds: 3000),
              curve: Curves.easeInOutCubicEmphasized,
              builder: (context, value, Widget child) {
                return Transform.translate(
                  offset: Offset(0.0, 200.0 * value),
                  child: CustomTextButton(
                    buttonText: 'Search Friends',
                    opacity: 1.0,
                    onPressed: () async {
                      // result = await Functions()
                      //     .getUsersFromFirebase(userProvider);
                      // print(result);
                    },
                  ),
                );
              }),
          Container(
            child: Text(
              'Friends Please',
              style: TextStyle(
                fontSize: Constant.h1,
                color: Constant.app_primary_color,
                fontWeight: Constant.app_font_weight,
              ),
            ),
          ),

          FutureBuilder(
            future: Future.wait(
              [
                Functions().getUsersFromFirebase(userProvider),
              ],
            ),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data[0] != null) {
                  result = snapshot.data[0];
                }
                return Column(
                  children: [
                    for (int i = 0; i < 20; i++)
                      Container(
                        width: 380,
                        child: FriendListRowEntryWidget(
                          name: result[result.keys.elementAt(i).toString()]
                              ['name'],
                          position: i + 1,
                        ),
                      ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    child: CircularProgressIndicator(
                      color: Constant.app_primary_color,
                      strokeWidth: 10.0,
                    ),
                  ),
                );
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
          ),
        ],
      ),
    );
  }
}
