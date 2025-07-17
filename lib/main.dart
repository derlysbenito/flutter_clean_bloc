import 'package:clean_architecture_bloc_app/di.dart';
import 'package:clean_architecture_bloc_app/features/pokemon/presentation/bloc/search_pokemon_bloc.dart';
import 'package:clean_architecture_bloc_app/features/pokemon/presentation/screens/pokemons_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.instance.get<SearchPokemonBloc>()),
      ],
      child: const MaterialApp(home: PokemonsScreen()),
    );
  }
}
