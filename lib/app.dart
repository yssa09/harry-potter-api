// import 'package:flow_builder/flow_builder.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:flutter/material.dart';
// import 'package:hp_characters/cubits/character_cubit.dart';

// import 'pages/characters_list_page.dart';
// import 'pages/character_details_page.dart';
// import 'pages/loading_page.dart';
// import 'cubits/character_state.dart';

// class CharacterApp extends StatelessWidget {
//   const CharacterApp({super.key});

//   List<Page> onGeneratePages(CharacterState state, List<Page> widgets) {
//     return [
//       if (state is ResponseCharacterState) CharactersListPage.page(),
//       if (state is InitCharacterState || state is LoadingCharacterState)
//         LoadingPage.page(),
//       if (state is CharacterDetailsState)
//         CharacterDetailsPage.page(character: state.character),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Harry Potter API',
//       home: FlowBuilder(
//           state: context.watch<CharacterCubit>().state,
//           onGeneratePages: onGeneratePages),
//     );
//   }
//   // @override
//   // Widget build(BuildContext context) {
//   //   return const MaterialApp(
//   //     home: CharactersListPage(),
//   //     debugShowCheckedModeBanner: false,
//   //   );
//   // }
// }
