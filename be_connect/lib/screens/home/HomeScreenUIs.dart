import 'package:flutter/material.dart';

class HomeScreenUIs {

  TabBar buildHomeTabBar(TabController tabController, List<Tab> tabs) {
    return TabBar(
      controller: tabController,
      tabs: tabs,
    );
  }

  TabBarView buildHomeTabBarView(TabController tabController, List<Widget> widgets) {
    return TabBarView(
      controller: tabController,
      children: widgets,
    );
  }

  FloatingActionButton buildHomeFloatingActionButton(VoidCallback onPressed) {
    return FloatingActionButton(
      onPressed: () => onPressed,
      child: Icon(Icons.add),
      backgroundColor: Colors.green,
    );
  }
}
