//Local Imports
import 'package:durood_together_app/Authentication/Authentication.dart';
import 'package:durood_together_app/Screens/SplashScreen/splash-screen.dart';
import 'package:durood_together_app/Services/LocationService/location_service.dart';
import 'package:durood_together_app/Shared/Locator/lcoator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Core/DataViewModels/DuroodCountModel/duroodCountVM.dart';
import 'Core/Providers/DuroodCountProvider/durood-count-provider.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DuroodApp());
}

class DuroodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Authentication>(
            create: (_) => Authentication(FirebaseAuth.instance)),
        Provider<LocationService>(create: (_) => LocationService()),
        StreamProvider(
            create: (context) =>
                context.read<Authentication>().authStateChanges),
        StreamProvider(
            create: (context) =>
                context.read<LocationService>().locationStream),
        ChangeNotifierProvider(
          create: (_) => locator<DuroodCountVM>(),
        ),
        ChangeNotifierProvider(
          create: (_) => locator<DuroodCountProvider>(),
        ),
        // ChangeNotifierProvider(
        //   create: (_) => locator<CRUDModel>(),
        // ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.teal[900],
          visualDensity: VisualDensity.adaptivePlatformDensity,
          //primaryColor: Color.fromARGB(1, 0, 132, 111)
        ),

        //Debug Banner Removing
        debugShowCheckedModeBanner: false,

        //Home
        home: SplashScreen(),
      ),
    );
  }
}
