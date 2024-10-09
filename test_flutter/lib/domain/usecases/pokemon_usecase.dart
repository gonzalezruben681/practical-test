import 'package:test_flutter/domain/entities/pokemon_entity.dart';
import 'package:test_flutter/domain/entities/pokemons_entity.dart';
import 'package:test_flutter/domain/repositories/pokemon_repository.dart';

class PokemonUsecase {
  final PokemonRepository pokemonRepository;

  PokemonUsecase({required this.pokemonRepository});

  Future<List<PokemonsEntity>> getPokemons() async {
    return await pokemonRepository.getPokemons();
  }

  Future<PokemonEntity> getPokemon(String name) async {
    return await pokemonRepository.getPokemon(name);
  }
}
