import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MusicalKeyBloc extends Cubit<List<String>> {
  MusicalKeyBloc(musicalKeys) : super(musicalKeys);

  void add(musicalKey) => {emit(state..add(musicalKey))};
  void remove(musicalKey) => {emit(state..remove(musicalKey))};
}
