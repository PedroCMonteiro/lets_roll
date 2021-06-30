import 'package:flutter/cupertino.dart';

class Group {
  int id;
  String name;

  Group({
    @required id,
    @required name,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    Group g = Group(
      id: json["id"],
      name: json["name"],
    );
    print(json);
    print('${g.id} ${g.name}');

    return g;
  }
}
