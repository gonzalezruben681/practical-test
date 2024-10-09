import 'package:test_flutter/domain/entities/pokemon_entity.dart';
import 'package:test_flutter/domain/entities/pokemons_entity.dart';

abstract interface class PokemonRepository {
  Future<List<PokemonsEntity>> getPokemons();
  Future<PokemonEntity> getPokemon(String name);
}
