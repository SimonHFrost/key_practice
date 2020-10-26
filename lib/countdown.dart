import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main.dart';

class Countdown extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Key Practice'),
      ),
      body: BlocBuilder<MusicCubit, String>(
        builder: (context, keys) {
          return CountdownView(keys: keys);
        },
      ),
    );
  }
}

class CountdownView extends StatefulWidget {
  var timeLeft = 60;
  final String keys;

  CountdownView({this.keys});

  @override
  _CountdownViewState createState() => _CountdownViewState();
}

class _CountdownViewState extends State<CountdownView> {
  Timer timer;
  String activeKey;

  @override
  dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    this.activeKey =
        widget.keys.characters.elementAt(widget.keys.characters.length - 1);
    timer = Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {
        widget.timeLeft = widget.timeLeft - 1;
        print(widget.timeLeft);
      });
    });
  }

  Widget build(BuildContext context) {
    return Center(
      child: Text(
        activeKey + ' COUNTDOWN ' + widget.timeLeft.toString(),
      ),
    );
  }
}
