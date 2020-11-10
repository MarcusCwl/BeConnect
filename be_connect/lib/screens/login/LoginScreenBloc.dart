import 'package:be_connect/screens/login/AuthBloc.dart';
import 'package:be_connect/screens/login/LoginScreenUI.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

class LoginScreenBloc {
  AuthBloc authBloc = new AuthBloc();
  LoginScreenUI loginScreenUI;
  CompositeSubscription compositeSubscription = new CompositeSubscription();

  LoginScreenBloc(this.loginScreenUI);

  void active() {
    authBloc.active();
    authBloc.authStateSubject.listen((authState) {
      if (authState == AuthState.Login) {
        loginScreenUI.onLoginSuccess();
      }
    }).addTo(compositeSubscription);
  }

  void deActive() {
    authBloc.deActive();
  }

  void loginWithGoogle() {
    authBloc.authByGoogle();
  }
}
