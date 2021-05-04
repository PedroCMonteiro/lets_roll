import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Category.dart';
import '../User.dart';

class MainCategoriesPage extends StatefulWidget {
  MainCategoriesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainCategoriesPageState createState() => _MainCategoriesPageState();
}

class _MainCategoriesPageState extends State<MainCategoriesPage> {
  double height = 60.0;
  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context).settings.arguments;
    if (user == null)
      user = User(
        username: 'pedro castro monteiro',
        profilePhoto: 'assets/img/Mufasa.jpg',
      );
    return Scaffold(
      appBar: AppBar(
        title: Text('Styles'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Category(
              icon: Icons.directions_bike,
              height: this.height,
              name: 'Bike',
            ),
            Category(
              height: this.height,
              name: 'Roller',
            ),
            Category(
              height: this.height,
              name: 'Skate',
            ),
          ],
        ),
      ),
    );
  }
}
