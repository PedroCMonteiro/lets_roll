import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lets_roll/icons/lets_roll_icons.dart';
// import 'package:swipedetector/swipedetector.dart';

import '../Category.dart';
import '../User.dart';
import 'EventPage.dart';
import 'GroupPage.dart';
import 'PlacePage.dart';
import 'ProductPage.dart';

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
        EventPage(categoryId: args.mainCategory.id),
        GroupPage(),
        PlacePage(),
        ProductPage(),
      ];

  static final List<Color> _colorIndex = [
    Colors.brown,
    Colors.red,
    Colors.orange,
    Colors.yellow
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = max(min(index, this._maxLength - 1), 0);
      print(_selectedIndex);
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

    return Scaffold(
      appBar: AppBar(
        title: Text(args.mainCategory.name),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: 30.0, top: 8.0, bottom: 8.0, right: 8.0),
            child: args.user,
          ),
        ],
      ),
      // body: SwipeDetector(
      //   child: Card(
      //     color: _colorIndex[_selectedIndex],
      //     child: _bottomNavigationBarOptions[_selectedIndex],
      //   ),
      //   onSwipeLeft: () => {swipe(details)},
      //   // onSwipeLeft: () => {_onItemTapped(_selectedIndex - 1)},
      //   onSwipeRight: () => {_onItemTapped(_selectedIndex + 1)},
      //   // onSwipeRight: () => {_onItemTapped(_selectedIndex + 1)},
      //   swipeConfiguration: SwipeConfiguration(
      //       horizontalSwipeMaxHeightThreshold: 50.0,
      //       horizontalSwipeMinDisplacement: 50.0,
      //       horizontalSwipeMinVelocity: 0.0),
      // ),
      body: GestureDetector(
        child: Card(
          color: _colorIndex[_selectedIndex],
          child: tabs[_selectedIndex],
        ),
        // onTapDown: (TapDownDetails details) {
        //   print('oi');
        //   initialX = details.globalPosition.dx;
        // },
        onHorizontalDragEnd: (DragEndDetails details) {
          print(details);
          swipe(details.primaryVelocity);
          // if (details.primaryVelocity > 0)
          //   _onItemTapped(_selectedIndex + 1);
          // else if (details.primaryVelocity < 0)
          //   _onItemTapped(_selectedIndex - 1);
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
    );
  }
}

class SubCategoriesPageArguments {
  final User user;
  final Category mainCategory;

  SubCategoriesPageArguments({this.user, this.mainCategory});
}
