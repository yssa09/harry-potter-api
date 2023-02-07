import 'dart:convert';
import 'package:http/http.dart' show get;

class CharactersRepository {
  Future<List<CharacterModel>> getCharacters() async {
    List<CharacterModel> characterInfoList = [];
    Uri uri = Uri.parse('https://hp-api.onrender.com/api/characters');
    var response = await get(uri);
    List list = json.decode(response.body) as List;
    for (var entry in list) {
      CharacterModel characterModel = CharacterModel.fromJson(entry);
      if (characterInfoList.length < 20) {
        characterInfoList.add(characterModel);
      }
    }
    return characterInfoList;
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

  // late int id;
  late String name;
  late String house;
  late String image;
  late String ancestry;
  late String patronus;
  late String actor;

  CharacterModel.fromJson(Map<String, dynamic> parsedJson) {
    name = parsedJson['name'];
    house = parsedJson['house'] == '' ? 'Not yet sorted' : parsedJson['house'];
    image = parsedJson['image'];
    ancestry =
        parsedJson['ancestry'] == '' ? 'Unknown' : parsedJson['ancestry'];
    patronus = parsedJson['patronus'] == '' ? 'None' : parsedJson['patronus'];
    actor = parsedJson['actor'];
  }
}
