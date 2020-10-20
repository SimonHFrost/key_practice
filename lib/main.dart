import 'package:flutter/material.dart';

enum MusicalKeyEvent { addMusicalKey }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Key Practice',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[Text('A'), Text('B'), Text('C')]);
  }
}
