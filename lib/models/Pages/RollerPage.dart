import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RollerPage extends StatefulWidget {
  RollerPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RollerPageeState createState() => _RollerPageeState();
}

class _RollerPageeState extends State<RollerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title == null ? '' : this.widget.title),
      ),
      body: Text(
        'Patins',
      ),
    );
  }
}
