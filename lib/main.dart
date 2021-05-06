import 'package:flutter/material.dart';
import 'models/Pages/LoginPage.dart';
import 'models/Pages/MainCategoriesPage.dart';
import 'models/Pages/SubCategoriesPage.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(30, 34, 97, .1),
  100: Color.fromRGBO(30, 34, 97, .2),
  200: Color.fromRGBO(30, 34, 97, .3),
  300: Color.fromRGBO(30, 34, 97, .4),
  400: Color.fromRGBO(30, 34, 97, .5),
  500: Color.fromRGBO(30, 34, 97, .6),
  600: Color.fromRGBO(30, 34, 97, .7),
  700: Color.fromRGBO(30, 34, 97, .8),
  800: Color.fromRGBO(30, 34, 97, .9),
  900: Color.fromRGBO(30, 34, 97, 1),
};
MaterialColor colorCustom = MaterialColor(0xFF472404, color);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Let\'s Roll',
      theme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: colorCustom,
        primarySwatch: colorCustom,
        primaryColor: colorCustom,
        accentColor: colorCustom[900],
      ),
      routes: {
        '/': (context) => LoginPage(),
        '/MainCategories': (context) => MainCategoriesPage(),
        '/SubCategories': (context) => SubCategoriesPage(),
      },
    );
  }
}
