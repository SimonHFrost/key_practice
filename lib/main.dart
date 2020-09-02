import 'dart:math';

import 'package:flutter/material.dart';
import 'countdown.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Key Practice',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Key Practice'),
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
  final List<int> colorCodes = <int>[600, 500, 100];
  final musicalKeys = ['C', 'G', 'D'];

  void _startRandom() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Countdown(musicalKey: musicalKeys[new Random().nextInt(3)])));
    });
  }

  FlatButton createRow(BuildContext context, String musicalKey, style) {
    return FlatButton(
      child: Text(musicalKey, style: style, textAlign: TextAlign.center),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Countdown(musicalKey: musicalKey)));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme
        .of(context)
        .textTheme
        .headline5;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Material(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.separated(
            itemCount: musicalKeys.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                color: Colors.amber[colorCodes[index]],
                child: Center(child: createRow(context, musicalKeys[index], headerStyle)),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _startRandom,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
