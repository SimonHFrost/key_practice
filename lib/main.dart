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
  final musicalKeys = ['C', 'G', 'D'];
  final activeKeys = [];

  void _startRandom() {
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Countdown(
                  musicalKey:
                      activeKeys[new Random().nextInt(activeKeys.length)])));
    });
  }

  FlatButton createRow(BuildContext context, String musicalKey, style) {
    return FlatButton(
      child: Text(musicalKey, style: style, textAlign: TextAlign.center),
      onPressed: () {
        setState(() {
          activeKeys.contains(musicalKey)
              ? activeKeys.remove(musicalKey)
              : activeKeys.add(musicalKey);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.headline5;

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
                color: activeKeys.contains(musicalKeys[index])
                    ? Colors.lime[100]
                    : Colors.amber[100],
                child: Center(
                    child: createRow(context, musicalKeys[index], headerStyle)),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
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
