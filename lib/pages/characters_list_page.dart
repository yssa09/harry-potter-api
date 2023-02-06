import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_characters/pages/character_details_page.dart';

import '../models/character_model.dart';
import '../cubits/character_cubit.dart';
import '../cubits/character_state.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({Key? key}) : super(key: key);

  static Page page() {
    return MaterialPage<void>(child: CharactersListPage());
  }

  @override
  State<StatefulWidget> createState() {
    return CharactersListPageState();
  }
}

class CharactersListPageState extends State<CharactersListPage> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<CharacterCubit>();
      cubit.fetchCharacter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Harry Potter Characters')),
      body: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          if (state is InitCharacterState || state is LoadingCharacterState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ResponseCharacterState) {
            var characters = state.characters;
            return ListView.builder(
              itemBuilder: ((context, index) {
                CharacterModel char = characters[index];
                return ListTile(
                  title: Text(char.name),
                  subtitle: Text(char.house),
                  onTap: () {
                    context.read<CharacterCubit>().fetchDetails(char);
                  },
                );
              }),
              itemCount: 20,
            );
          } else if (state is CharacterDetailsState) {
            var char = state.character;
            return CharacterDetailsPage(character: char);
          }
          return Text(state.toString());
        },
      ),
    );
  }
}

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Harry Potter Characters')),
  //     body: ListView.builder(
  //       itemBuilder: ((context, index) {
  //         return ListTile();
  //         // CharacterModel char = characters[index];
  //         // return ListTile(
  //         //   title: Text(char.name),
  //         //   subtitle: Text(char.house),
  //         //   onTap: () {
  //         //     context.read<CharacterCubit>().fetchDetails(char);
  //         //   },
  //         // );
  //       }),
  //       itemCount: 20,
  //     ),
  //   );
  // }