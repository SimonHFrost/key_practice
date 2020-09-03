import 'dart:async';

import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  final String musicalKey;

  int timeLeft = 60;

  Countdown({Key key, this.musicalKey}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _CountdownState();
}

class _CountdownState extends State<Countdown> {
  Timer _timer;

  _CountdownState() {
    _timer = Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {
        if (widget.timeLeft < 1) {
          Navigator.pop(context);
          return;
        }

        widget.timeLeft--;
      });
    });
  }

  String _formatTime(int duration) {
    int minutes = duration ~/ 60;
    int seconds = duration % 60;

    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Key Practice'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(widget.musicalKey,
                style: Theme.of(context).textTheme.headline1),
            Text(_formatTime(widget.timeLeft),
                style: Theme.of(context).textTheme.display1),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.stop),
      ),
    );
  }
}
