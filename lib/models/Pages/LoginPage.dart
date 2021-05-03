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

  @override
  Widget build(BuildContext context) {
    TextEditingController _user = TextEditingController();
    TextEditingController _password = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login')),
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
                ),
                maxLength: 100,
              ),
            ),
            ElevatedButton(
                onPressed: () => {
                      if (_user.text.isNotEmpty && validaSenha())
                        {
                          Navigator.pushNamed(
                            context,
                            '/MainCategories',
                            arguments: User(
                              username: _user.text,
                              profilePhoto: 'assets/img/Mufasa.jpg',
                            ),
                          ),
                        }
                      else
                        {
                          print('Erro'),
                        }
                    },
                child: Text('Login'))
          ],
        ),
      ),
    );
  }

  bool validaSenha() {
    return true;
  }
}
