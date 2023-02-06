import 'package:flutter/material.dart';
import '../models/character_model.dart';

class CharacterDetailsPage extends StatelessWidget {
  const CharacterDetailsPage(Key? key, {required this.character})
      : super(key: key);

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(20),
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
      ),
    );
  }
}
