import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lets_roll/models/Category.dart';

import '../Utils.dart';

// ignore: must_be_immutable
class Event {
  int id;
  String name;
  DateTime date;
  List<Category> categories;

  Event({
    this.id,
    this.name,
    this.date,
    this.categories,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    List<Category> categories = [];
    for (Map c in json['categories']) categories.add(Category.fromJson(c));
    return Event(
      id: json['id'],
      name: json['name'],
      date: DateTime.parse(json['event_datetime']),
      categories: categories,
    );
  }
}

class EventPage extends StatefulWidget {
  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<EventPage> {
  Widget build(BuildContext context) {
    final Event event = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(event.name),
      ),
      body: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.calendar_today, size: 45),
              title: Text(event.name),
              subtitle: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      'Data: ${Utils.dateTimeToString(event.date, 'dd/MM/yyyy')}'),
                  Text('Hora: ${event.date.hour}:${event.date.minute}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
