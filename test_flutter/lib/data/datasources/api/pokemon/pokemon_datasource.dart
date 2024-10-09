import 'package:test_flutter/data/models/pokemon_model.dart';
import 'package:test_flutter/data/models/pokemons_model.dart';

abstract interface class PokemonDatasource {
  Future<List<PokemonsModel>> getPokemons();
  Future<PokemonModel> getPokemon(String name);
}
