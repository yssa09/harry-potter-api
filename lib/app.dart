import 'package:flutter/material.dart';

import 'pages/characters_list_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CharactersListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
