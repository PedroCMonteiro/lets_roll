import 'package:lets_roll/models/Category.dart';

class Event {
  int id = -1;
  String name = "";
  DateTime date = DateTime.now();
  List<Category> categories = [];

  Event({id, name, date, categories});

  factory Event.fromJson(Map<String, dynamic> json) {
    List<Category> categories = [];
    for (Map p in json['categories']) categories.add(Category.fromJson(p));
    return Event(
      id: json['id'],
      name: json['name'],
      date: DateTime.parse(json['event_datetime']),
      categories: categories,
    );
  }
}
