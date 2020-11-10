import 'package:be_connect/screens/login/LoginScreenBloc.dart';
import 'package:be_connect/screens/login/LoginScreenUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LoginScreenWidget(title: 'Flutter Demo Login Page');
  }
}

class LoginScreenWidget extends StatefulWidget {
  LoginScreenWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  LoginScreenWidgetState createState() => LoginScreenWidgetState();
}

class LoginScreenWidgetState extends State<LoginScreenWidget> with SingleTickerProviderStateMixin implements LoginScreenUI {
  LoginScreenBloc loginScreenBloc;

  @override
  void initState() {
    loginScreenBloc = LoginScreenBloc(this);
    loginScreenBloc.active();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Login'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => login(),
        child: Icon(Icons.headset),
        backgroundColor: Colors.green,
      ),
    );
  }

  void login() {
    print('Try login');
    loginScreenBloc.loginWithGoogle();
  }

  @override
  void onLoginFailed() {
    print('Try Failed');
  }

  @override
  void onLoginSuccess() {
    Navigator.pushReplacementNamed(context, '/AppHome');
  }
}
