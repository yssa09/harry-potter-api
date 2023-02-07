import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

import '../models/character_model.dart';
import '../cubits/character_cubit.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage<void>(child: CharactersListPage());
  }

  @override
  State<StatefulWidget> createState() {
    return CharactersListPageState();
  }
}

class CharactersListPageState extends State<CharactersListPage> {
  CharactersListPageState();

  @override
  initState() {
    Future.delayed(const Duration(seconds: 0), () async {
      Uri uri = Uri.parse('https://hp-api.onrender.com/api/characters');
      var response = await get(uri);
      List list = json.decode(response.body) as List;
      setState(() {
        for (var entry in list) {
          CharacterModel characterModel = CharacterModel.fromJson(entry);
          if (characterInfoList.length < 20) {
            characterInfoList.add(characterModel);
          }
        }
      });
    });
  }

  List<CharacterModel> characterInfoList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Harry Potter API',
          ),
        ),
        body: SingleChildScrollView(
          child: charactersListWidget(),
        ),
      ),
    );
  }

  Widget charactersListWidget() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .89,
      child: ListView.builder(
        itemCount: characterInfoList.length,
        itemBuilder: ((context, index) {
          var character = characterInfoList[index];
          return (ListTile(
            title: Text(character.name),
            subtitle: Text(character.house),
            onTap: () {
              context.read<CharacterCubit>().fetchDetails(character);
            },
          ));
        }),
      ),
    );
  }
}
