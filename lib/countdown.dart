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
  Timer timer;

  @override
  dispose() {
    timer.cancel();
    super.dispose();
  }

  _CountdownViewState() {
    timer = Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {
        widget.timeLeft = widget.timeLeft - 1;
        print(widget.timeLeft);
      });
    });
  }

  Widget build(BuildContext context) {
    return BlocBuilder<MusicCubit, String>(builder: (context, keys) {
      return Center(
        child: Text(
          keys.toString() + 'COUNTDOWN ' + widget.timeLeft.toString(),
        ),
      );
    });
  }
}
