import 'package:flutter/material.dart';
import 'package:my_app_from_scratch/screens/favorite_screen.dart';
import 'package:my_app_from_scratch/screens/home_screen.dart';
import 'package:my_app_from_scratch/screens/parameters_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomNavigationBarModel {

  List<PersistentBottomNavBarItem> _bottomNavigationBarItem = [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home),
      activeColor: Colors.white,
      inactiveColor: Colors.grey[300],
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.favorite),
      activeColor: Colors.white,
      inactiveColor: Colors.grey[300],
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.settings),
      activeColor: Colors.white,
      inactiveColor: Colors.grey[300],
    ),
  ];

  List<Widget> getBarItems(PersistentTabController controller) {
    return [
      Home(), 
      Favorite(persistentTabController: controller,),         // <=== I passed PersistentTabController here
      Parameters(),
    ];
  }

  List<PersistentBottomNavBarItem> get bottomNavigationBarItems => _bottomNavigationBarItem;
}