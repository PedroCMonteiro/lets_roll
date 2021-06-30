import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Product.dart';

// import '../Category.dart';

class ProductPage extends StatefulWidget {
  int categoryId;
  ProductPage({this.categoryId});
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product> products = List.empty();

  Future<Null> fetchProducts(int categoryId) async {
    final response = await http.get(Uri.parse(
        'http://service-lets-roll.herokuapp.com/api/events?categoryIdIn=${categoryId.toString()}'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final data = jsonDecode(response.body);
      setState(() {
        for (Map p in data['data']) products.add(Product.fromJson(p));
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load products');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProducts(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(products[index].name),
                  subtitle: Text(products[index].link),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
