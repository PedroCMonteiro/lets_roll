import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lets_roll/models/Api.dart';
import 'package:lets_roll/models/Product.dart';
import 'package:provider/provider.dart';

import '../Provider.dart';

// import '../Category.dart';

class ProductsPage extends StatefulWidget {
  int categoryId;
  ProductsPage({this.categoryId});
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Product> products = List.empty();

  @override
  void initState() {
    super.initState();
    products = Provider.of<SubCategoriesProvider>(context, listen: false)
        .getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text(products[index].name),
                    subtitle: Text(products[index].link),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/Product',
                arguments: products[index],
              );
            },
          );
        },
      ),
    );
  }
}
