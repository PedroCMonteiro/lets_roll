import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../User.dart';

// import '../Category.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double height = 60.0;
  TextEditingController _user = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _hidePassword = true;

  void changeVisibilty() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: TextField(
                controller: _user,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username / Email',
                ),
                maxLength: 100,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: TextField(
                controller: _password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  suffix: InkWell(
                    child: Icon(_hidePassword
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onTap: changeVisibilty,
                  ),
                ),
                maxLength: 100,
                obscureText: _hidePassword,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    onPressed: () => {fazerLogin()},
                    child: Text('Login'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    onPressed: () => {
                      Navigator.pushNamed(
                        context,
                        '/NewUser',
                      )
                    },
                    child: Text('New User'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void fazerLogin() {
    if (validaLogin()) {
      Navigator.pushNamed(
        context,
        '/MainCategories',
        arguments: User(
          username: _user.text,
          profilePhoto: 'assets/img/Mufasa.jpg',
        ),
      );
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Erro'),
          content: const Text('Usuário e/ou Senha incorretas'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  bool validaLogin() {
    return true;
  }
}
