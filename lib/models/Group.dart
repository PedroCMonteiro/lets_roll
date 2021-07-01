import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Group {
  int id;
  String name;

  Group({
    this.id,
    this.name,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      name: json['name'],
    );
  }
}

class GroupPage extends StatefulWidget {
  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<GroupPage> {
  Widget build(BuildContext context) {
    Group group = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(group.name),
      ),
      body: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.people_alt, size: 45),
              title: Text(group.name),
              subtitle: Text('Identificador: ${group.id.toString()}'),
            ),
          ],
        ),
      ),
    );
  }
}
