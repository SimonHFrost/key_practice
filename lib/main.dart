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

class HomeView extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocBuilder<MusicCubit, List<String>>(
      builder: (context, List<String> keys) => Scaffold(
        body: Column(
          children: [
            Column(children: keys.map((key) => Text(key)).toList()),
            FlatButton(
              onPressed: () {
                context.bloc<MusicCubit>().addKey('A');
              },
              child: Text('A'),
            ),
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
