import 'package:test_flutter/data/datasources/api/pokemon/pokemon_datasource.dart';
import 'package:test_flutter/domain/entities/pokemon_entity.dart';
import 'package:test_flutter/domain/entities/pokemons_entity.dart';
import 'package:test_flutter/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource pokemonDatasource;

  PokemonRepositoryImpl({required this.pokemonDatasource});

  @override
  Future<PokemonEntity> getPokemon(String name) async {
    try {
      final pokemon = await pokemonDatasource.getPokemon(name);
      return pokemon.toEntity();
    } catch (e) {
      throw Exception('Error al obtener el Pokémon: $e');
    }
  }

  @override
  Future<List<PokemonsEntity>> getPokemons() async {
    try {
      final pokemons = await pokemonDatasource.getPokemons();
      return pokemons.map((pokemon) => pokemon.toEntity()).toList();
    } catch (e) {
      throw Exception('Error al obtener la lista de Pokémon: $e');
    }
  }
}
