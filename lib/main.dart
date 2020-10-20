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
    return BlocBuilder<MusicCubit, List<String>>(
      builder: (context, List<String> keys) {
        return Text(keys.toString());
      },
    );
  }
}

class KeyButtons extends StatelessWidget {
  List<String> keys = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];

  Widget build(BuildContext context) {
    return Column(
        children: keys.map((e) {
      return MaterialButton(
        child: Text(e),
        onPressed: () => context.bloc<MusicCubit>().addKey(e),
      );
    }).toList());
  }
}

class HomeView extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocBuilder<MusicCubit, List<String>>(
      builder: (context, List<String> keys) => Scaffold(
        body: Column(
          children: [
            ActiveKeys(),
            KeyButtons(),
          ],
        ),
      ),
    );
  }
}

class MusicCubit extends Cubit<List<String>> {
  MusicCubit() : super([]);

  void addKey(key) => emit(state..add(key));
}
