import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';

import '../User.dart';
import 'EventPage.dart';
import 'GroupPage.dart';
import 'PlacePage.dart';
import 'ProductPage.dart';

class SubCategoriesPage extends StatefulWidget {
  SubCategoriesPage({Key key}) : super(key: key);

  @override
  _SubCategoriesPageState createState() => _SubCategoriesPageState();
}

class _SubCategoriesPageState extends State<SubCategoriesPage> {
  double height = 60.0;
  int _selectedIndex = 0;

  static final List<Widget> _bottomNavigationBarOptions = <Widget>[
    EventPage(),
    GroupPage(),
    PlacePage(),
    ProductPage(),
    ProductPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = max(min(index, 5), 0);
      print(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    final SubCategoriesPageArguments args =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(args.mainCategory),
        ),
      ),
      body: SwipeDetector(
        child: _bottomNavigationBarOptions[_selectedIndex],
        onSwipeLeft: () => {_onItemTapped(_selectedIndex - 1)},
        onSwipeRight: () => {_onItemTapped(_selectedIndex + 1)},
        swipeConfiguration: SwipeConfiguration(
            verticalSwipeMinVelocity: 0.0,
            verticalSwipeMinDisplacement: 50.0,
            verticalSwipeMaxWidthThreshold: 100.0,
            horizontalSwipeMaxHeightThreshold: 50.0,
            horizontalSwipeMinDisplacement: 50.0,
            horizontalSwipeMinVelocity: 0.0),
      ),
      bottomNavigationBar: Stack(
        children: <Widget>[
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 24,
            backgroundColor: Colors.lightBlue[100],
            // fixedColor: Theme.of(context).primaryColor,
            // fixedColor: Colors.purple,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.lightBlue,
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
                  Icons.tag,
                ),
                label: 'Products',
                tooltip: '',
              ),
              BottomNavigationBarItem(
                icon: const Icon(null, size: 0),
                label: '',
                tooltip: '',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
          Positioned(
            right: 32.0,
            top: 8.5,
            child: args.user,
          )
        ],
      ),
    );
  }
}

class SubCategoriesPageArguments {
  final User user;
  final String mainCategory;

  SubCategoriesPageArguments({this.user, this.mainCategory});
}
