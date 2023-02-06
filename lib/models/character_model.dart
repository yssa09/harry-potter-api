import 'dart:convert';

import 'package:http/http.dart' as http;

class CharactersRepository {
  Future<List<CharacterModel>> getCharacters() async {
    const url = 'https://hp-api.onrender.com/api/characters';
    final Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List;
      var list = body.map((e) {
        return CharacterModel(
          name: e['name'],
          house: e['house'] == '' ? 'Not yet sorted' : e['house'],
          image: e['image'],
          ancestry: e['ancestry'],
          patronus: e['patronus'] == '' ? 'None' : e['patronus'],
          actor: e['actor'],
        );
      }).toList();
      return list;
    } else {
      throw "Something went wrong ${response.statusCode}";
    }
  }
}

class CharacterModel {
  CharacterModel({
    required this.name,
    required this.house,
    required this.image,
    required this.ancestry,
    required this.patronus,
    required this.actor,
  });

  late String name;
  late String house;
  late String image;
  late String ancestry;
  late String patronus;
  late String actor;
}
