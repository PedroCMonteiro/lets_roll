import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lets_roll/icons/lets_roll_icons.dart';
import 'package:provider/provider.dart';
// import 'package:swipedetector/swipedetector.dart';

import '../../Provider.dart';
import '../Category.dart';
import '../User.dart';
import 'EventsPage.dart';
import 'GroupsPage.dart';
import 'PlacesPage.dart';
import 'ProductsPage.dart';

class SubCategoriesPage extends StatefulWidget {
  @override
  _SubCategoriesPageState createState() => _SubCategoriesPageState();
}

class _SubCategoriesPageState extends State<SubCategoriesPage> {
  double height = 60.0;
  int _selectedIndex = 0;
  int _maxLength;
  SubCategoriesPageArguments args;

  List<Widget> _bottomNavigationBarOptions() => <Widget>[
        EventsPage(categoryId: args.mainCategory.id),
        GroupsPage(),
        PlacesPage(),
        ProductsPage(),
      ];

  static final List<Color> _colorIndex = [
    Colors.blue.shade500,
    Colors.blue.shade300,
    Colors.blue.shade300,
    Colors.blue.shade500,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = max(min(index, this._maxLength - 1), 0);
      // print(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;
    List<Widget> tabs = _bottomNavigationBarOptions();
    _maxLength = tabs.length;
    void swipe(double vel) {
      if (vel != 0.0) _onItemTapped(_selectedIndex + (vel < 0.0 ? 1 : -1));
    }

    return ChangeNotifierProvider(
      create: (context) =>
          SubCategoriesProvider(categoryId: args.mainCategory.id),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.mainCategory.name),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, top: 8.0, bottom: 8.0, right: 8.0),
              child: args.user.build(context),
            ),
          ],
        ),
        backgroundColor: Colors.blue.shade700,
        body: GestureDetector(
          child: Card(
            color: _colorIndex[_selectedIndex],
            child: tabs[_selectedIndex],
          ),
          onHorizontalDragEnd: (DragEndDetails details) {
            print(details);
            swipe(details.primaryVelocity);
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 24,
          backgroundColor: Colors.lightBlue[100],
          // fixedColor: Theme.of(context).primaryColor,
          // fixedColor: Colors.purple,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.deepPurple,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
              ),
              label: 'Events',
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people,
              ),
              tooltip: '',
              label: 'Groups',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.location_pin,
              ),
              label: 'Places',
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                LetsRoll.helmet,
              ),
              label: 'Products',
              tooltip: '',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class SubCategoriesPageArguments {
  final User user;
  final Category mainCategory;

  SubCategoriesPageArguments({this.user, this.mainCategory});
}
