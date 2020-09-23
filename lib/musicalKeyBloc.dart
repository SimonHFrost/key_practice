import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum MusicalKeyEvent { addMusicalKey }

class MusicalKeyBloc extends Bloc<MusicalKeyEvent, List<String>> {
  MusicalKeyBloc(musicalKeys) : super(musicalKeys);

  @override
  Stream<List<String>> mapEventToState(MusicalKeyEvent event) async* {
    switch (event) {
      case MusicalKeyEvent.addMusicalKey:
        yield state..add('B');
        break;
    }
  }
}
