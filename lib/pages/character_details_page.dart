import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_characters/cubits/character_cubit.dart';
import '../models/character_model.dart';
import '../cubits/character_state.dart';

class CharacterDetailsPage extends StatelessWidget {
  CharacterDetailsPage({required this.character});

  static Page page({required CharacterModel character}) {
    return MaterialPage<void>(
      child: CharacterDetailsPage(
        character: character,
      ),
    );
  }

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: Text(character.name),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_back),
          onPressed: () => context.read<CharacterCubit>().fetchCharacter(),
        ),
        body: SafeArea(child: listWidget(character)),
      );
    });
  }
}

Widget listWidget(CharacterModel character) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          width: 300,
          height: 450,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            'House: ${character.house}\nAncestry: ${character.ancestry}\nPatronus: ${character.patronus}\nPortrayed by: ${character.actor}',
            style: const TextStyle(letterSpacing: .5, height: 2),
          ),
        ),
      ],
    ),
  );
}
