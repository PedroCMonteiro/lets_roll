class Categories {
  int id;
  String name;

  Categories({id, name, categories, link});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Product {
  int id;
  String name;
  List<Categories> categories;
  String link;
  String image;

  Product({id, name, categories, link});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      categories: json['categories'],
      link: json['link'],
    );
  }
}
