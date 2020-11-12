import 'package:be_connect/screens/login/AuthBloc.dart';
import 'package:be_connect/screens/login/LoginScreenUI.dart';
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
    print('Login Screen bloc deActive');
    authBloc.deActive();
  }

  void loginWithGoogle() {
    authBloc.authByGoogle();
  }
}
