import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Category.dart';

class Product {
  int id;
  String name;
  List<Category> categories;
  String link;
  String image;

  Product({
    this.link,
    this.id,
    this.name,
    this.categories,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    List<Category> categories = [];
    for (Map c in json['categories']) categories.add(Category.fromJson(c));
    return Product(
      id: json['id'],
      name: json['name'],
      link: json['link'],
      categories: categories,
    );
  }
}

class ProductPage extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<ProductPage> {
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.people_alt, size: 45),
              title: Text(product.name),
            ),
          ],
        ),
      ),
    );
  }
}
