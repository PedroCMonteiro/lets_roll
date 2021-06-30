import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Pages/SubCategoriesPage.dart';

import 'User.dart';

// ignore: must_be_immutable
class Category extends StatefulWidget {
  final int id;
  final String name;
  final double height;
  IconData icon;

  Category({
    @required this.id,
    this.icon,
    @required this.name,
    this.height,
  }) {
    if (this.icon == null) this.icon = Icons.tag;
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;

    return GestureDetector(
      child: Container(
        // width: this.widget.height * 4.0,
        height: this.widget.height,
        child: Card(
          // color: Theme.of(context).primarySwatch,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(this.widget.height * 0.5),
          ),
          child: ListTile(
            leading: Icon(
              this.widget.icon,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              this.widget.name ?? 'Nome Categoria',
              // style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ),
      onTap: () => Navigator.pushNamed(
        context,
        '/SubCategories',
        arguments: SubCategoriesPageArguments(
          mainCategory: this.widget,
          user: user,
        ),
      ),
    );
  }
}
