import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_flutter/domain/entities/pokemon_entity.dart';
import 'package:test_flutter/domain/usecases/pokemon_usecase.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonUsecase pokemonUseCase;
  PokemonBloc({required this.pokemonUseCase}) : super(PokemonInitial()) {
    on<GetPokemonEvent>(
      (event, emit) async {
        emit(PokemonLoading());
        try {
          final pokemon = await pokemonUseCase.getPokemon(event.name);
          emit(PokemonSuccess(pokemon: pokemon));
        } catch (e) {
          emit(PokemonError(message: e.toString()));
        }
      },
    );
  }
}
