import 'package:bloc/bloc.dart';
import '../models/character_model.dart';

import 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepository repository;
  CharacterCubit(this.repository) : super(InitCharacterState());

  Future<void> fetchCharacter() async {
    emit(LoadingCharacterState());
    final response = await repository.getCharacters();
    emit(ResponseCharacterState(response));
  }

  void fetchDetails(character) {
    emit(CharacterDetailsState(character));
  }
}
