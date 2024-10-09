import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final String name;
  final List<String> abilities;
  final List<String> moves;
  final String imageUrl;

  const PokemonEntity({
    required this.name,
    required this.abilities,
    required this.moves,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [abilities, moves, imageUrl];
}
