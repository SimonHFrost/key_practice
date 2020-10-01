import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'countdown.dart';
import 'musicalKeyBloc.dart';

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
      home: BlocProvider(
        create: (context) => MusicalKeyBloc(['C']),
        child: MyHomePage(title: 'Key Practice'),
      ),
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

  void _startRandom() {
    // TODO Figure out where context comes from
    final musicalKeysBloc = context.bloc<MusicalKeyBloc>();

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

  BlocBuilder createRow(BuildContext context, String musicalKey, style) {
    return BlocBuilder<MusicalKeyBloc, List<String>>(builder: (context, state) {
      return FlatButton(
        child: Text(musicalKey, style: style, textAlign: TextAlign.center),
        onPressed: () {
          if (state.contains(musicalKey)) {
            context.bloc<MusicalKeyBloc>().remove(musicalKey);
          } else {
            context.bloc<MusicalKeyBloc>().add(musicalKey);
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.headline5;

    Widget buildListOfButtons(state, musicalKeys) {
      return Expanded(
        child: ListView.separated(
          itemCount: musicalKeys.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: state.contains(musicalKeys[index])
                  ? Colors.lime[100]
                  : Colors.amber[100],
              child: Center(
                  child: createRow(context, musicalKeys[index], headerStyle)),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      );
    }

    return BlocBuilder<MusicalKeyBloc, List<String>>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Material(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: <Widget>[
                buildListOfButtons(state, musicalKeys),
                buildListOfButtons(state, minorKeys),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _startRandom,
          child: Icon(Icons.play_arrow),
        ),
      );
    });
  }
}
