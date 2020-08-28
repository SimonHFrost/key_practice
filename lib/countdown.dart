import 'package:flutter/material.dart';

class Countdown extends StatelessWidget {
  final String musicalKey;

  const Countdown({ @required this.musicalKey });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(musicalKey),
      ),
      body: Center(child: Text(this.musicalKey)),
    );
  }
}