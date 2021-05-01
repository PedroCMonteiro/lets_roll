import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../Category.dart';

class ProductPage extends StatelessWidget {
  final double height = 60.0;
  final String title;

  ProductPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Produtos'),
    );
  }
}
