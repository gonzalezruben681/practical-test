import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/data/datasources/api/pokemon/pokemon_datasource_impl.dart';
import 'package:test_flutter/data/datasources/firebase/auth_datasource_impl.dart';
import 'package:test_flutter/data/repositories/auth_repository_impl.dart';
import 'package:test_flutter/data/repositories/pokemon_repository_impl.dart';
import 'package:test_flutter/domain/usecases/auth_usecase.dart';
import 'package:test_flutter/domain/usecases/pokemon_usecase.dart';
import 'package:test_flutter/firebase_options.dart';
import 'package:test_flutter/presentation/blocs/auth/auth_bloc.dart';
import 'package:test_flutter/presentation/blocs/pokemon/pokemon_bloc.dart';
import 'package:test_flutter/presentation/blocs/pokemons/pokemons_bloc.dart';
import 'package:test_flutter/presentation/screens/detail_pokemon_screen.dart';
import 'package:test_flutter/presentation/screens/home_screen.dart';
import 'package:test_flutter/presentation/screens/login_screen.dart';
import 'package:test_flutter/presentation/screens/profile_screen.dart';
import 'package:test_flutter/presentation/screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            authenticationUseCase: AuthenticationUseCase(
                authenticationRepository:
                    AuthRepositoryImpl(authDatasource: AuthDatasourceImpl())),
          ),
        ),
        BlocProvider<PokemonsBloc>(
          create: (context) => PokemonsBloc(
            pokemonUseCase: PokemonUsecase(
              pokemonRepository: PokemonRepositoryImpl(
                pokemonDatasource: PokemonDatasourceImpl(),
              ),
            ),
          ),
        ),
        BlocProvider<PokemonBloc>(
          create: (context) => PokemonBloc(
            pokemonUseCase: PokemonUsecase(
              pokemonRepository: PokemonRepositoryImpl(
                pokemonDatasource: PokemonDatasourceImpl(),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Test',
        initialRoute: '/login',
        routes: {
          '/': (context) => const HomePage(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/detail': (context) => const DetailPokemonScreen(),
        },
      ),
    );
  }
}
