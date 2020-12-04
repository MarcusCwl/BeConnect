import 'package:be_connect/customView/CardListView.dart';
import 'package:be_connect/model/view/BusinessCardViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditCardScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return EditCardScreenWidget(title: 'Flutter Demo Home Page');
  }
}

class EditCardScreenWidget extends StatefulWidget {
  EditCardScreenWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  EditCardScreenWidgetState createState() => EditCardScreenWidgetState();
}

class EditCardScreenWidgetState extends State<EditCardScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CardListView(ConstVal.FAKE_CARDS), // This
    ));
  }
}
