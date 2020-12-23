import 'package:flutter/material.dart';
import 'package:Hora/screens/favorite_screen.dart';
import 'package:Hora/screens/parameters_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import 'models/bottomNavigationBarModel.dart';
import 'models/favorite_model.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

BuildContext testContext;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers : [
      ChangeNotifierProvider(
      create: (BuildContext context) {
        return FavModel();
      },),
      Provider(create: (context) => BottomNavigationBarModel())
      ],
      child: MaterialApp(
        title: 'Hora',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        home: BottomTabScreen(),
      initialRoute: '/',
      routes: {
        '/first': (context) => Home(),
        '/second': (context) => Favorite(),
        '/third' : (context) => Parameters(),
      },
      ),
    );
  }
}

class BottomTabScreen extends StatelessWidget {

  final _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return  Consumer<BottomNavigationBarModel>(
      builder: (BuildContext context, BottomNavigationBarModel bottomNavigationBarModel, Widget child) {
        return PersistentTabView(
          context,
          controller: _controller,
          screens: bottomNavigationBarModel.getBarItems(_controller),
          items: bottomNavigationBarModel.bottomNavigationBarItems,
          navBarHeight: MediaQuery.of(context).size.height/12,
          confineInSafeArea: true,
          backgroundColor: Colors.blue,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(0.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          itemAnimationProperties: ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            animateTabTransition: false,
          ),
          navBarStyle: NavBarStyle.style6,
        );
      },
    );
  }
}
