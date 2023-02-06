import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hp_characters/models/character_model.dart';
import 'package:hp_characters/pages/characters_list_page.dart';
import 'cubits/character_cubit.dart';
// import 'app.dart';

// void main(List<String> args) {
//   runApp(BlocProvider(
//     create: (_) => CharacterCubit(CharactersRepository()),
//     child: CharacterApp(),
//   ));
// }
void main(List<String> args) {
  runApp(const CharacterApp());
}

class CharacterApp extends StatelessWidget {
  const CharacterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CharacterCubit(CharactersRepository());
      },
      child: const MaterialApp(
        home: CharactersListPage(),
      ),
    );
  }
}
