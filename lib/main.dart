import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'countdown.dart';

enum MusicalKeyEvent { addMusicalKey }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MusicCubit>(
      create: (context) => MusicCubit(),
      child: MaterialApp(
        title: 'Key Practice',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: HomeView(),
      ),
    );
  }
}

class KeyButtons extends StatelessWidget {
  List<String> availableKeys = [
    'A',
    'A#',
    'B',
    'C',
    'C#',
    'D',
    'D#',
    'E',
    'F',
    'F#',
    'G',
    'G#'
  ];

  Widget build(BuildContext context) {
    return BlocBuilder<MusicCubit, List<String>>(builder: (context, keys) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: availableKeys.map((e) {
          var active = keys.contains(e);
          return MaterialButton(
            height: 50,
            color: keys.contains(e) ? Colors.amber : Colors.white,
            child: Text(e),
            onPressed: () {
              if (active) {
                context.bloc<MusicCubit>().removeKey(e);
              } else {
                context.bloc<MusicCubit>().addKey(e);
              }
            },
          );
        }).toList(),
      );
    });
  }
}

class HomeView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Key Practice'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Countdown()));
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: KeyButtons(),
    );
  }
}

class MusicCubit extends Cubit<List<String>> {
  MusicCubit() : super(List<String>());

  void addKey(key) {
    List<String> newList = []..addAll(state..add(key));
    emit(newList);
  }

  void removeKey(key) {
    List<String> newList = []..addAll(state..remove(key));
    emit(newList);
  }
}
