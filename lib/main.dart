import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hp_characters/models/character_model.dart';
// import 'package:hp_characters/pages/characters_list_page.dart';
import 'cubits/character_cubit.dart';
import 'app.dart';

void main() {
  runApp(BlocProvider(
    create: (_) => CharacterCubit(CharactersRepository()),
    child: const CharacterApp(),
  ));
}
