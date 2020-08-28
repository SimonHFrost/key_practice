import 'dart:async';

import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  final String musicalKey;

  int timeLeft = 5;

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

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.musicalKey),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Time Remaining:', style: Theme.of(context).textTheme.display1),
            Text(widget.timeLeft.toString(), style: Theme.of(context).textTheme.display1),
          ],
        ),
      ),
    );
  }
}
