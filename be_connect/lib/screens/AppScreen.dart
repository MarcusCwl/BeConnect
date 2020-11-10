import 'package:be_connect/screens/home/HomeScreen.dart';
import 'package:be_connect/screens/login/LoginScreen.dart';
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
      initialRoute: '/Splash',
      routes: {
        '/Splash': (_) => SplashScreen(),
        '/Login': (_) => LoginScreen(),
        '/AppHome': (_) => HomeScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}