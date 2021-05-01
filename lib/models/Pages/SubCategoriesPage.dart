import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String title = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _bottomNavigationBarOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue[100],
        // fixedColor: Theme.of(context).primaryColor,
        fixedColor: Colors.purple,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              color: Colors.lightBlue,
            ),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              color: Colors.lightBlue,
            ),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_pin,
              color: Colors.lightBlue,
            ),
            label: 'Places',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.tag,
              color: Colors.lightBlue,
            ),
            label: 'Products',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
