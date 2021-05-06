import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Pages/UserPage.dart';

class User extends StatelessWidget {
  final String username;
  final String profilePhoto;

  User({this.username, this.profilePhoto});
  String userToolTip(String username) {
    int maxLen = 20;
    return username.length > maxLen
        ? '${username.substring(0, maxLen)}...'
        : username;
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
            child: Text(username
                .split(' ')
                .map((x) => x[0])
                .join('')
                .substring(0, min(2, username.split(' ').length))
                .toUpperCase()),
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
