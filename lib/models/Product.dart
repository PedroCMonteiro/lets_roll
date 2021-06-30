class Product {
  int id;
  String name;
  List<int> categories;
  String link;
  String image;

  Product({id, name, image, categories, link});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      categories: json['categories'],
      link: json['link'],
    );
  }
}
