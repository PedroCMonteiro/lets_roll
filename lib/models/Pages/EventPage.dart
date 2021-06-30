import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:lets_roll/models/Category.dart';
import 'package:lets_roll/models/Event.dart';
import 'package:http/http.dart' as http;

class EventPage extends StatefulWidget {
  int categoryId;
  EventPage({this.categoryId});
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List<Event> events = [];

  Future<Null> fetchEvents(int categoryId) async {
    final response = await http.get(Uri.parse(
      'https://service-lets-roll.herokuapp.com/api/events?categoryIdIn=${categoryId.toString()}',
    ));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final data = jsonDecode(response.body);
      print(response.body);
      setState(() {
        for (Map e in data['data']) events.add(Event.fromJson(e));
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load events');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchEvents(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.calendar_today, size: 45),
                  title: Text(events[index].name),
                  subtitle: Text(
                      '${events[index].date.day.toString().padLeft(2, '0')}/${events[index].date.month.toString().padLeft(2, '0')}/${events[index].date.year.toString().padLeft(4, '0')}'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
