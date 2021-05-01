import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../Category.dart';

class EventPage extends StatelessWidget {
  final String title;
  final double height = 60.0;

  EventPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Eventos'),
    );
  }
}
