import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/presentation/blocs/pokemon/pokemon_bloc.dart';

class DetailPokemonScreen extends StatelessWidget {
  const DetailPokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle'),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PokemonError) {
            return Center(child: Text(state.message));
          } else if (state is PokemonSuccess) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Detail Pokemon',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Name:',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 10),
                        Text(state.pokemon.name),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Image.network(
                      state.pokemon.imageUrl,
                      height: 150,
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Habilidades:',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Center(
                          child: SizedBox(
                            height: 100,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.pokemon.abilities.length,
                              itemBuilder: (context, index) {
                                return Center(
                                  child: Text(state.pokemon.abilities[index]),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Movimientos:',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Center(
                          child: SizedBox(
                            height: 100,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.pokemon.moves.length,
                              itemBuilder: (context, index) {
                                return Center(
                                  child: Text(state.pokemon.moves[index]),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
