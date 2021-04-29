import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BikePage extends StatefulWidget {
  BikePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BikePageeState createState() => _BikePageeState();
}

class _BikePageeState extends State<BikePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title == null ? '' : this.widget.title),
      ),
      body: Text(
        'Bike',
      ),
    );
  }
}
