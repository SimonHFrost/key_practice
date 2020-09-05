import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'countdown.dart';

enum MusicalKeyEvent { addMusicalKey }

class MusicalKeyBloc extends Bloc<MusicalKeyEvent, List<String>> {
  MusicalKeyBloc(musicalKeys) : super(musicalKeys);

  @override
  Stream<List<String>> mapEventToState(MusicalKeyEvent event) async* {
    switch (event) {
      case MusicalKeyEvent.addMusicalKey:
        yield state..add('B');
        break;
    }
  }
}

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
  final musicalKeys = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
  final minorKeys = ['Cm', 'Dm', 'Em', 'Fm', 'Gm', 'Am', 'Bm'];

  final musicalKeysBloc = new MusicalKeyBloc(['C']);

  void _startRandom() {
    if (musicalKeysBloc.state.length < 1) {
      return;
    }

    final randomIndex = new Random().nextInt(musicalKeysBloc.state.length);

    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Countdown(musicalKey: musicalKeysBloc.state[randomIndex])));
    });
  }

  FlatButton createRow(BuildContext context, String musicalKey, style) {
    return FlatButton(
      child: Text(musicalKey, style: style, textAlign: TextAlign.center),
      onPressed: () {
        setState(() {
          musicalKeysBloc.state.contains(musicalKey)
              ? musicalKeysBloc.state.remove(musicalKey)
              : musicalKeysBloc.state.add(musicalKey);
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
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListView.separated(
                  itemCount: musicalKeys.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      color: musicalKeysBloc.state.contains(musicalKeys[index])
                          ? Colors.lime[100]
                          : Colors.amber[100],
                      child: Center(
                          child: createRow(
                              context, musicalKeys[index], headerStyle)),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: minorKeys.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      color: musicalKeysBloc.state.contains(minorKeys[index])
                          ? Colors.lime[100]
                          : Colors.amber[100],
                      child: Center(
                          child: createRow(
                              context, minorKeys[index], headerStyle)),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              ),
            ],
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
