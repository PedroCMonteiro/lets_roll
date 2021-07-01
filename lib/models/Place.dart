import 'Category.dart';

class Place {
  int id = -1;
  String name;
  List<Category> categories = [];

  Place({
    this.id,
    this.name,
    this.categories,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    List<Category> categories = [];
    for (Map p in json['categories']) categories.add(Category.fromJson(p));
    return Place(
      id: json['id'],
      name: json['name'],
      categories: categories,
    );
  }
}
