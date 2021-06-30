import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lets_roll/models/Api.dart';
import 'package:lets_roll/models/Event.dart';
import 'package:provider/provider.dart';

import '../Provider.dart';

class EventsPage extends StatefulWidget {
  int categoryId;
  EventsPage({this.categoryId});
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  List<Event> events = [];

  Future<Null> fetchEvents(int categoryId) async {
    events = await Api.getEventsByCategoryId(categoryId);
    print(categoryId);
  }

  @override
  void initState() {
    super.initState();
    events =
        Provider.of<SubCategoriesProvider>(context, listen: false).getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
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
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/Event',
                arguments: EventsPageArguments(event: events[index]),
              );
            },
          );
        },
      ),
    );
  }
}

class EventsPageArguments {
  Event event;

  EventsPageArguments({event});
}
