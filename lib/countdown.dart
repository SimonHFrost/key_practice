import 'package:flutter/material.dart';

class Countdown extends StatelessWidget {
  final String musicalKey;

  const Countdown({ @required this.musicalKey });

  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text(this.musicalKey)));
  }
}