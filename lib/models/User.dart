import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class User extends StatelessWidget {
  final String username;
  final String profilePhoto;

  User({this.username, this.profilePhoto});

  Widget build(BuildContext context) {
    print(username);
    if (profilePhoto == null) {
      return Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              profilePhoto,
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.brown.shade800,
            child: Center(
              child: Text(username
                  .split(' ')
                  .map((x) => x[0])
                  .join('')
                  .substring(0, min(2, username.split(' ').length))
                  .toUpperCase()),
            ),
          ),
        ],
      );
    }
  }
}
