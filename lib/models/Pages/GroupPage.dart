import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Group.dart';

class GroupPage extends StatefulWidget {
  int categoryId;
  GroupPage({categoryId});
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  List<Group> groups = [];

  Future<Null> fetchEvents(int categoryId) async {
    try {
      categoryId = 2;
      print(categoryId);
      final response = await http.get(Uri.parse(
        'https://service-lets-roll.herokuapp.com/api/groups',
      ));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        final data = jsonDecode(response.body);
        print(data);
        setState(() {
          for (Map p in data['data']) groups.add(Group.fromJson(p));
        });
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load groups');
      }
    } catch (ex) {
      throw ex;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchEvents(this.widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  subtitle: Text(groups[index].name),
                  title: Text(groups[index].id.toString()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
