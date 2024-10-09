import 'package:equatable/equatable.dart';

class PokemonsEntity extends Equatable {
  final String name;
  final String url;

  const PokemonsEntity({
    required this.name,
    required this.url,
  });

  @override
  List<Object?> get props => [name, url];
}
