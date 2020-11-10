import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

enum AuthState { Logging, Login, Logout, Idle }

class AuthBloc {
  BehaviorSubject<AuthState> authStateSubject = new BehaviorSubject<AuthState>();
  CompositeSubscription compositeSubscription = new CompositeSubscription();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  void active() {
    firebaseAuth.authStateChanges().listen((User user) {
      if (user != null) {
        print('Bao, user already login');
        authStateSubject.add(AuthState.Login);
      } else {
        print('Bao, user already log out');
        authStateSubject.add(AuthState.Logout);
      }
    }).addTo(compositeSubscription);
  }

  void authByGoogle() {
    authStateSubject.add(AuthState.Logging);
    Stream.fromFuture(googleSignIn.signIn())
        .flatMap((GoogleSignInAccount googleUser) => Stream.fromFuture(googleUser.authentication))
        .map((GoogleSignInAuthentication googleAuth) => GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken))
        .flatMap((OAuthCredential credential) => Stream.fromFuture(firebaseAuth.signInWithCredential(credential)))
        .listen((UserCredential _) {
      //DoNothing
    }).addTo(compositeSubscription);
  }

  void loginWithPhone() {}

  void loginWithFacebook() {}

  void deActive() {
    authStateSubject.close();
    compositeSubscription.clear();
  }
}
