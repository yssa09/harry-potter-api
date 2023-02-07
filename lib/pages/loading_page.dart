import 'package:flutter/material.dart';
import '../cubits/character_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage<void>(child: LoadingPage());
  }

  @override
  Widget build(BuildContext context) {
    context.read<CharacterCubit>().fetchCharacter();
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
