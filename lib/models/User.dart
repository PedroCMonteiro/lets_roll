import 'dart:math';
import 'Group.dart';

// ignore: must_be_immutable
class User {
  int id;
  String username;
  String password;
  String email;
  String profilePhoto;
  List<Group> _groups = [];

  User({
    this.id,
    this.username,
    this.email,
    this.profilePhoto,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      profilePhoto: json['profilePhoto'],
    );
  }

  String userToolTip() {
    int maxLen = 20;

    return username.length > maxLen
        ? '${username.substring(0, maxLen)}...'
        : username;
  }

  List<Group> getGroups() {
    return _groups;
  }

  // Future<Null> addGroup(int groupId) async {
  //   Group group = await Api.getGroupById(groupId);
  //   _groups.add(group);
  //   notifyListeners();
  // }

  String shortName() {
    if (username == null || username == '') return '';

    return username
        .split(' ')
        .map((x) => x[0])
        .join('')
        .substring(0, min(2, username.split(' ').length))
        .toUpperCase();
  }
}
