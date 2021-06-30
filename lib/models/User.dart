import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Pages/UserPage.dart';

// ignore: must_be_immutable
class User extends StatelessWidget {
  int id = -1;
  String username = "";
  String email = "";
  String profilePhoto = "";

  User({id, username, email, profilePhoto});

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

  String shortName() {
    if (username == '') return '';

    return username
        .split(' ')
        .map((x) => x[0])
        .join('')
        .substring(0, min(2, username.split(' ').length))
        .toUpperCase();
  }

  Widget build(BuildContext context) {
    if (profilePhoto == null) {
      return GestureDetector(
        child: CircleAvatar(
          backgroundImage: AssetImage(
            profilePhoto,
          ),
        ),
        onTap: () => {},
      );
    } else {
      return GestureDetector(
        child: CircleAvatar(
          // backgroundColor: Colors.brown.shade800,
          child: Center(
            child: Text(shortName()),
          ),
        ),
        onTap: () => {
          Navigator.pushNamed(context, '/User',
              arguments: UserPageArguments(user: this))
        },
      );
    }
  }
}
