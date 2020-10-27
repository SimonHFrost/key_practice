import 'dart:async';
import 'dart:math';

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
  var maxTime = 60;
  var timeLeft;
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

  reset() {
    setState(() {
      var charactersMinusActiveKey = activeKey == null
          ? widget.keys
          : widget.keys.replaceFirst(activeKey, '');
      activeKey = charactersMinusActiveKey.characters
          .elementAt(new Random().nextInt(charactersMinusActiveKey.length));
      widget.timeLeft = widget.maxTime;
    });
  }

  @override
  void initState() {
    super.initState();
    this.reset();
    timer = Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {
        if (widget.timeLeft <= 0) {
          this.reset();
        } else {
          widget.timeLeft = widget.timeLeft - 1;
        }
      });
    });
  }

  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  backgroundColor: Color.fromRGBO(0, 0, 0, 1),
                  value: 1 - (widget.timeLeft / widget.maxTime),
                  strokeWidth: 10,
                ),
                Text(
                  activeKey,
                  style: TextStyle(fontSize: 100),
                ),
                Text(
                  widget.timeLeft.toString(),
                  style: TextStyle(fontSize: 60),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
