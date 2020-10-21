import 'dart:async';

import 'package:flutter/material.dart';

class Countdown extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Key Practice'),
      ),
      body: CountdownView(),
    );
  }
}

class CountdownView extends StatefulWidget {
  var timeLeft = 60;

  @override
  _CountdownViewState createState() => _CountdownViewState();
}

class _CountdownViewState extends State<CountdownView> {
  _CountdownViewState() {
    Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {
        widget.timeLeft = widget.timeLeft - 1;
        print(widget.timeLeft);
      });
    });
  }

  Widget build(BuildContext context) {
    return Center(child: Text('COUNTDOWN ' + widget.timeLeft.toString()));
  }
}
