import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lets_roll/models/Category.dart';

// import '../Category.dart';

class RollerPage extends StatefulWidget {
  RollerPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RollerPageState createState() => _RollerPageState();
}

class _RollerPageState extends State<RollerPage> {
  double height = 60.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patins'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Category(
              icon: Icons.calendar_today,
              height: this.height,
              name: 'Events',
            ),
            Category(
              icon: Icons.people,
              height: this.height,
              name: 'Groups',
            ),
            Category(
              icon: Icons.map,
              height: this.height,
              name: 'Places',
            ),
            Category(
              height: this.height,
              name: 'Products',
            ),
          ],
        ),
      ),
    );
  }
}
