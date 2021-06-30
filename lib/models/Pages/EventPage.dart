import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lets_roll/models/Event.dart';
import 'package:http/http.dart' as http;

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List<Event> products = [];

  Future<Null> fetchEvents(int categoryId) async {
    try {
      final response = await http.get(
          Uri.parse(
            'https://service-lets-roll.herokuapp.com/api/events?categoryIdIn=${categoryId.toString()}',
          ),
          headers: {
            "Accept": "application/json",
          });

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        print(response.body);
        final data = jsonDecode(response.body);
        setState(() {
          for (Map p in data.data) products.add(Event.fromJson(p));
        });
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load events');
      }
    } catch (ex) {
      throw ex;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchEvents(2);
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
                  leading: Icon(Icons.calendar_today, size: 45),
                  title: Text(products[index].date.toString()),
                  subtitle: Text(products[index].name),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
