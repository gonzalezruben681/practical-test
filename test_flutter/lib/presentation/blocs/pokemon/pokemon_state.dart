part of 'pokemon_bloc.dart';

sealed class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

final class PokemonInitial extends PokemonState {}

final class PokemonLoading extends PokemonState {}

final class PokemonSuccess extends PokemonState {
  final PokemonEntity pokemon;

  const PokemonSuccess({required this.pokemon});

  @override
  List<Object> get props => [pokemon];
}

final class PokemonError extends PokemonState {
  final String message;

  const PokemonError({required this.message});

  @override
  List<Object> get props => [message];
}
