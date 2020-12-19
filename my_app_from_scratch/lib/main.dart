import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/favorite_model.dart';
import 'models/home_model.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => HomeModel()),
        ChangeNotifierProxyProvider<HomeModel, FavModel>(
          create: (context) => FavModel(),
          update: (context, list, fav) {
            fav.list = list;
            return fav;
          },
        ),
      ],
      child: MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
