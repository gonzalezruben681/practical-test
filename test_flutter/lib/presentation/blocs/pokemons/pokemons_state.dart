part of 'pokemons_bloc.dart';

sealed class PokemonsState extends Equatable {
  const PokemonsState();

  @override
  List<Object> get props => [];
}

class PokemonsInitial extends PokemonsState {}

class PokemonsLoading extends PokemonsState {}

class PokemonsSuccess extends PokemonsState {
  final List<PokemonsEntity> pokemons;

  const PokemonsSuccess({required this.pokemons});

  @override
  List<Object> get props => [pokemons];
}

class PokemonsError extends PokemonsState {
  final String message;

  const PokemonsError({required this.message});

  @override
  List<Object> get props => [message];
}
