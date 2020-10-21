import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum MusicalKeyEvent { addMusicalKey }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Key Practice',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: BlocProvider<MusicCubit>(
          create: (BuildContext context) => MusicCubit(),
          child: HomeView(),
        ));
  }
}

class ActiveKeys extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocBuilder<MusicCubit, String>(
      builder: (context, keys) {
        return Text(keys.toString());
      },
    );
  }
}

class KeyButtons extends StatelessWidget {
  List<String> availableKeys = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];

  Widget build(BuildContext context) {
    return BlocBuilder<MusicCubit, String>(builder: (context, keys) {
      return Column(
        children: availableKeys.map((e) {
          var active = keys.contains(e);
          return MaterialButton(
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
        onPressed: () => {},
        child: const Icon(Icons.play_arrow),
      ),
      body: Column(
        children: [
          ActiveKeys(),
          KeyButtons(),
        ],
      ),
    );
  }
}

class MusicCubit extends Cubit<String> {
  MusicCubit() : super('');

  void addKey(key) => emit(state + key);
  void removeKey(key) => emit(state.replaceFirst(key, ''));
}
