import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/presentation/blocs/pokemon/pokemon_bloc.dart';
import 'package:test_flutter/presentation/blocs/pokemons/pokemons_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BlocBuilder<PokemonsBloc, PokemonsState>(
                builder: (context, state) {
                  if (state is PokemonsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is PokemonsError) {
                    return Text(state.message);
                  } else if (state is PokemonsSuccess) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.pokemons.length,
                      itemBuilder: (context, index) {
                        final pokemon = state.pokemons[index];
                        return ListTile(
                          title: Text(pokemon.name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          subtitle: Text(pokemon.url),
                          onTap: () {
                            context
                                .read<PokemonBloc>()
                                .add(GetPokemonEvent(name: pokemon.name));
                            Navigator.pushNamed(context, '/detail');
                          },
                        );
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
