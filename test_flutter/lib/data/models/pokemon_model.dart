import 'package:test_flutter/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  const PokemonModel({
    required super.name,
    required super.abilities,
    required super.moves,
    required super.imageUrl,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'],
      abilities: List<String>.from(
          json['abilities'].map((ability) => ability['ability']['name'])),
      moves:
          List<String>.from(json['moves'].map((move) => move['move']['name'])),
      imageUrl: json['sprites']['other']['home']['front_default'],
    );
  }

  PokemonEntity toEntity() => PokemonEntity(
        name: name ,
        abilities: abilities,
        moves: moves,
        imageUrl: imageUrl,
      );
}
