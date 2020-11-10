import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

class SplashScreen extends StatelessWidget {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final CompositeSubscription compositeSubscription = new CompositeSubscription();

  Future<bool> checkIfUserSignIn() async {
    return googleSignIn.isSignedIn();
  }

  @override
  Widget build(BuildContext context) {
    initFlutterFire(context);
    return Scaffold(
        body: Center(
      child: Text("Loading..."),
    ));
  }

  void initFlutterFire(BuildContext context) {
    Stream.fromFuture(Firebase.initializeApp())
        .flatMap((value) => Stream.fromFuture(googleSignIn.isSignedIn()))
        .listen((bool isSignedIn) => {moveToNextScreen(context, isSignedIn)})
        .addTo(compositeSubscription);
  }

  void moveToNextScreen(BuildContext context, bool isUserSignedIn) {
    if (isUserSignedIn) {
      Navigator.pushReplacementNamed(context, '/AppHome');
    } else {
      Navigator.pushReplacementNamed(context, '/Login');
    }
  }
}
