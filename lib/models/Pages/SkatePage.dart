import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkatePage extends StatefulWidget {
  SkatePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SkatePageState createState() => _SkatePageState();
}

class _SkatePageState extends State<SkatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title == null ? '' : this.widget.title),
      ),
      body: Text(
        'Skate',
      ),
    );
  }
}
