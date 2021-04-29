import 'package:flutter/material.dart';
import 'models/Category.dart';
import 'models/Pages/SkatePage.dart';
import 'models/Pages/BikePage.dart';
import 'models/Pages/RollerPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Let\'s Roll',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/': (context) => MyHomePage(),
        '/Skate': (context) => SkatePage(),
        '/Roller': (context) => RollerPage(),
        '/Bike': (context) => BikePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double height = 60.0;
  int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title == null ? '' : widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Category(
              icon: Icons.directions_bike,
              height: this.height,
              name: 'Skate',
            ),
            Category(
              icon: Icons.directions_bike,
              height: this.height,
              name: 'Bike',
            ),
            Category(
              icon: Icons.local_grocery_store_outlined,
              height: this.height,
              name: 'Roller',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
