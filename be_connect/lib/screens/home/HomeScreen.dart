import 'package:be_connect/cardstore/CloudCardManager.dart';
import 'package:be_connect/screens/cardsbox/CardsBoxScreen.dart';
import 'package:be_connect/screens/home/HomeScreenUIs.dart';
import 'package:be_connect/screens/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreenWidget(title: 'Flutter Demo Home Page', homeScreenUIs: new HomeScreenUIs()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreenWidget extends StatefulWidget {
  HomeScreenWidget({Key key, this.title, this.homeScreenUIs}) : super(key: key);
  final String title;
  HomeScreenUIs homeScreenUIs;

  @override
  HomeScreenWidgetState createState() => HomeScreenWidgetState(homeScreenUIs);
}

class HomeScreenWidgetState extends State<HomeScreenWidget> with SingleTickerProviderStateMixin {
  TabController _tabController;
  HomeScreenUIs homeScreenUIs;
  final List<Tab> titleTabs = <Tab>[Tab(text: 'MyCards'), Tab(text: 'CardsBox')];

  HomeScreenWidgetState(this.homeScreenUIs);

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
      appBar: AppBar(backgroundColor: Colors.black, title: homeScreenUIs.buildHomeTabBar(_tabController, titleTabs)),
      body: homeScreenUIs.buildHomeTabBarView(_tabController, <Widget>[CardsBoxScreen(), CardsBoxScreen()]),
      floatingActionButton: homeScreenUIs.buildHomeFloatingActionButton(addNewCard),
    );
  }

  void addNewCard() {
    Navigator.pushReplacementNamed(context, ROUTE_EDIT_CARD);
  }
}
