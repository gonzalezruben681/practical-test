import 'package:test_flutter/domain/entities/pokemons_entity.dart';

class PokemonsModel extends PokemonsEntity {
  const PokemonsModel({
    required super.name,
    required super.url,
  });

  factory PokemonsModel.fromJson(Map<String, dynamic> json) {
    return PokemonsModel(
      name: json['name'],
      url: json['url'],
    );
  }

  PokemonsEntity toEntity() => PokemonsEntity(
        name: name,
        url: url,
      );
}
