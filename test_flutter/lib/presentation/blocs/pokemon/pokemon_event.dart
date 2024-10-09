part of 'pokemon_bloc.dart';

sealed class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class GetPokemonEvent extends PokemonEvent {
  final String name;

  const GetPokemonEvent({required this.name});

  @override
  List<Object> get props => [name];
}
