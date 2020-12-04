import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

import '../routes.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final CompositeSubscription compositeSubscription = new CompositeSubscription();

  Future<bool> checkIfUserSignIn() async {
    return googleSignIn.isSignedIn();
  }

  @override
  void initState() {
    super.initState();
    initFlutterFire(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text("Loading..."),
    ));
  }

  @override
  void deactivate() {
    print('Splash Screen deActive');
    compositeSubscription.clear();
    super.deactivate();
  }

  void initFlutterFire(BuildContext context) {
    Stream.fromFuture(Firebase.initializeApp())
        .flatMap((value) => Stream.fromFuture(googleSignIn.isSignedIn()))
        .listen((bool isSignedIn) => {moveToNextScreen(context, isSignedIn)})
        .addTo(compositeSubscription);
  }

  void moveToNextScreen(BuildContext context, bool isUserSignedIn) {
    if (isUserSignedIn) {
      Navigator.pushReplacementNamed(context, ROUTE_SPLASH);
    } else {
      Navigator.pushReplacementNamed(context, ROUTE_LOGIN);
    }
  }
}
