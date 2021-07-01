import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lets_roll/models/Group.dart';
import 'package:provider/provider.dart';

import '../Provider.dart';

class GroupsPage extends StatefulWidget {
  @override
  _GroupsPageState createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  List<Group> groups = [];

  @override
  void initState() {
    super.initState();
    groups =
        Provider.of<SubCategoriesProvider>(context, listen: false).getGroups();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    subtitle: Text(groups[index].name ?? 'Nome Grupo'),
                    title: Text(groups[index].id.toString()),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/Group',
                arguments: groups[index],
              );
            },
          );
        },
      ),
    );
  }
}
