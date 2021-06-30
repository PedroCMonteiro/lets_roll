import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lets_roll/icons/lets_roll_icons.dart';
import 'package:lets_roll/models/Category.dart';
import 'package:lets_roll/models/User.dart';

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
      backgroundColor: Colors.blue.shade700,
      appBar: AppBar(
        title: Text('Let\'s Roll'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Category(
              id: 0,
              icon: LetsRoll.bicycle_rider,
              height: this.height,
              name: 'Bike',
            ),
            Category(
              id: 1,
              icon: LetsRoll.roller_skate,
              height: this.height,
              name: 'Roller',
            ),
            Category(
              id: 2,
              icon: LetsRoll.skater,
              height: this.height,
              name: 'Skate',
            ),
          ],
        ),
      ),
    );
  }
}
