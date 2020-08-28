import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  final String musicalKey;

  const Countdown({ @required this.musicalKey });

  @override
  State<StatefulWidget> createState() => new _CountdownState();
}

class _CountdownState extends State<Countdown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.musicalKey),
      ),
      body: Center(child: Text(widget.musicalKey)),
    );
  }
}