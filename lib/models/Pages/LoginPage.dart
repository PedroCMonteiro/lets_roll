import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Login'),
            ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/MainCategories'),
                child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
