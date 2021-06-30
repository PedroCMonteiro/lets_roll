import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lets_roll/models/Category.dart';

// ignore: must_be_immutable
class Event extends StatelessWidget {
  int id;
  String name;
  DateTime date;
  List<Category> categories;

  Event({
    @required id,
    @required name,
    @required date,
    @required categories,
  });

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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.calendar_today, size: 45),
              title: Text(name ?? 'Nome do Evento'),
              subtitle: Text(
                  '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString().padLeft(4, '0')}'),
            ),
          ],
        ),
      ),
    );
  }
}
