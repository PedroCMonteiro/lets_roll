import 'package:flutter/material.dart';
import 'models/Pages/LoginPage.dart';
import 'models/Pages/MainCategoriesPage.dart';
import 'models/Pages/SubCategoriesPage.dart';

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
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue[900],
      ),
      routes: {
        '/': (context) => LoginPage(),
        '/MainCategories': (context) => MainCategoriesPage(),
        '/SubCategories': (context) => SubCategoriesPage(),
      },
    );
  }
}
