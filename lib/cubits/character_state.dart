// import 'package:equatable/equatable.dart';

import '../models/character_model.dart';

abstract class CharacterState {}

class InitCharacterState extends CharacterState {}

class LoadingCharacterState extends CharacterState {}

class ResponseCharacterState extends CharacterState {
  List<CharacterModel> characters;
  ResponseCharacterState(this.characters);
}

class CharacterDetailsState extends CharacterState {
  CharacterModel character;
  CharacterDetailsState(this.character);

  // @override
  // List<Object?> get props => [character];
}
