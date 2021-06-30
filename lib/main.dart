import 'package:flutter/material.dart';
import 'models/Pages/LoginPage.dart';
import 'models/Pages/MainCategoriesPage.dart';
import 'models/Pages/NewUserPage.dart';
import 'models/Pages/SubCategoriesPage.dart';
import 'models/Pages/UserPage.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(83, 158, 255, .1),
  100: Color.fromRGBO(83, 158, 255, .2),
  200: Color.fromRGBO(83, 158, 255, .3),
  300: Color.fromRGBO(83, 158, 255, .4),
  400: Color.fromRGBO(83, 158, 255, .5),
  500: Color.fromRGBO(83, 158, 255, .6),
  600: Color.fromRGBO(83, 158, 255, .7),
  700: Color.fromRGBO(83, 158, 255, .8),
  800: Color.fromRGBO(83, 158, 255, .9),
  900: Color.fromRGBO(83, 158, 255, 1),
};
MaterialColor colorCustom = MaterialColor(0xFF3b2290, color);

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
        backgroundColor: colorCustom,
        primarySwatch: colorCustom,
        primaryColor: colorCustom,
        accentColor: Colors.grey[900],
      ),
      routes: {
        '/': (context) => LoginPage(),
        '/MainCategories': (context) => MainCategoriesPage(),
        '/SubCategories': (context) => SubCategoriesPage(),
        '/User': (context) => UserPage(),
        '/NewUser': (context) => NewUserPage(),
      },
    );
  }
}
