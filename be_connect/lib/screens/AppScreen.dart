import 'package:be_connect/screens/editor/EditCardScreen.dart';
import 'package:be_connect/screens/home/HomeScreen.dart';
import 'package:be_connect/screens/login/LoginScreen.dart';
import 'package:be_connect/screens/routes.dart';
import 'package:be_connect/screens/splash/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppScreen());
}

class AppScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ROUTE_SPLASH,
      routes: {
        ROUTE_SPLASH: (_) => SplashScreen(),
        ROUTE_LOGIN: (_) => LoginScreen(),
        ROUTE_APP_HOME: (_) => HomeScreen(),
        ROUTE_EDIT_CARD: (_) => EditCardScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}