import 'package:flutter/material.dart';
import 'models/Pages/LoginPage.dart';
import 'models/Pages/MainCategoriesPage.dart';
import 'models/Pages/SubCategoriesPage.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(71, 36, 4, .1),
  100: Color.fromRGBO(71, 36, 4, .2),
  200: Color.fromRGBO(71, 36, 4, .3),
  300: Color.fromRGBO(71, 36, 4, .4),
  400: Color.fromRGBO(71, 36, 4, .5),
  500: Color.fromRGBO(71, 36, 4, .6),
  600: Color.fromRGBO(71, 36, 4, .7),
  700: Color.fromRGBO(71, 36, 4, .8),
  800: Color.fromRGBO(71, 36, 4, .9),
  900: Color.fromRGBO(71, 36, 4, 1),
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
        primarySwatch: colorCustom,
        primaryColor: colorCustom,
        accentColor: colorCustom,
        //  fontFamily: 'Georgia',
        //  textTheme: TextTheme(
        //     headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        //     headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        //     bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        //   ),
      ),
      routes: {
        '/': (context) => LoginPage(),
        '/MainCategories': (context) => MainCategoriesPage(),
        '/SubCategories': (context) => SubCategoriesPage(),
      },
    );
  }
}
