import 'package:be_connect/customView/CardListView.dart';
import 'package:be_connect/model/view/BusinessCardViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateCardScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CreateCardScreenWidget(title: 'Flutter Demo Home Page');
  }
}

class CreateCardScreenWidget extends StatefulWidget {
  CreateCardScreenWidget({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  CreateCardScreenWidgetState createState() => CreateCardScreenWidgetState();
}

class CreateCardScreenWidgetState extends State<CreateCardScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CardListView(ConstVal.FAKE_CARDS), // This
    ));
  }
}
