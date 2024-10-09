import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_flutter/domain/entities/pokemons_entity.dart';
import 'package:test_flutter/domain/usecases/pokemon_usecase.dart';

part 'pokemons_event.dart';
part 'pokemons_state.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  final PokemonUsecase pokemonUseCase;
  PokemonsBloc({required this.pokemonUseCase}) : super(PokemonsInitial()) {
    on<GetPokemonsEvent>(
      (event, emit) async {
        emit(PokemonsLoading());
        try {
          final pokemons = await pokemonUseCase.getPokemons();
          emit(PokemonsSuccess(pokemons: pokemons));
        } catch (e) {
          emit(PokemonsError(message: e.toString()));
        }
      },
    );
  }
}
