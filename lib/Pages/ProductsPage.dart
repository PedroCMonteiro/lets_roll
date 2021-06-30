import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lets_roll/models/Api.dart';
import 'package:lets_roll/models/Product.dart';

// import '../Category.dart';

class ProductsPage extends StatefulWidget {
  int categoryId;
  ProductsPage({this.categoryId});
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Product> products = List.empty();

  Future<Null> fetchProducts(int categoryId) async {
    products = await Api.getProducts();
    // products = await Api.getProductsCategoryId(categoryId);
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
