import 'package:be_connect/screens/CardDetailScreen.dart';
import 'package:be_connect/screens/CardsBoxScreen.dart';
import 'package:be_connect/screens/CreateCardScreen.dart';
import 'package:be_connect/screens/EditCardScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(HomeScreen());

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreenWidget(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomeScreenWidget extends StatefulWidget {
  HomeScreenWidget({Key key, this.title}) : super(key: key);
  final String title;
  @override
  HomeScreenWidgetState createState() => HomeScreenWidgetState();
}

class HomeScreenWidgetState extends State<HomeScreenWidget> with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Tab> titleTabs = <Tab>[
    Tab(text: 'CardsBox'),
    Tab(text: 'CardDetail'),
    Tab(text: 'CreateCard'),
    Tab(text: 'EditCard'),
  ];

  @override
  void initState() {
    super.initState();
    this._tabController = new TabController(vsync: this, length: titleTabs.length);
    this._tabController.addListener(() {
      print(this._tabController.toString());
      print(this._tabController.index);
      print(this._tabController.length);
      print(this._tabController.previousIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: TabBar(
            controller: this._tabController,
            tabs: titleTabs,
          ),
        ),
        body: TabBarView(
          controller: this._tabController,
          children: <Widget>[CardsBoxScreen(), CardDetailScreen(), CreateCardScreen(), EditCardScreen()],
        ));
  }
}
