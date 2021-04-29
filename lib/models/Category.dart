import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @required
  final String name;
  final double height;
  final IconData icon;

  Category({this.icon, this.name, this.height});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: this.widget.height * 4.0,
        height: this.widget.height,
        child: Card(
          // color: Theme.of(context).accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(this.widget.height * 0.5),
          ),
          child: ListTile(
            leading: Icon(this.widget.icon),
            title: Text(this.widget.name),
          ),
        ),
      ),
      onTap: () => Navigator.pushNamed(context, '/${this.widget.name}'),
    );
  }
}
