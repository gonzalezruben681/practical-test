import 'package:dio/dio.dart';
import 'package:test_flutter/data/datasources/api/pokemon/pokemon_datasource.dart';
import 'package:test_flutter/data/models/pokemon_model.dart';
import 'package:test_flutter/data/models/pokemons_model.dart';

class PokemonDatasourceImpl implements PokemonDatasource {
  final Dio dio = Dio();
  final url = 'https://pokeapi.co/api/v2/pokemon';

  PokemonDatasourceImpl();

  @override
  Future<PokemonModel> getPokemon(String name) async {
    try {
      final response = await dio.get('$url/$name');
      if (response.statusCode == 200) {
        final pokemon = PokemonModel.fromJson(response.data);
        return pokemon;
      } else {
        throw Exception('Error al obtener el Pokémon');
      }
    } catch (e) {
      throw Exception('Error al obtener el Pokémon: $e');
    }
  }

  @override
  Future<List<PokemonsModel>> getPokemons() async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['results'];
        return results
            .map((pokemon) => PokemonsModel.fromJson(pokemon))
            .toList();
      } else {
        throw Exception('Error al obtener la lista de Pokémon');
      }
    } catch (e) {
      throw Exception('Error al obtener la lista de Pokémon: $e');
    }
  }
}
