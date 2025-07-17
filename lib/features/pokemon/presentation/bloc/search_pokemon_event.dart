import 'package:clean_architecture_bloc_app/features/pokemon/domain/entities/pokemon.dart';

sealed class SearchPokemonEvent {}

class OnSearchPokemon extends SearchPokemonEvent {}

class OnCapturePokemon extends SearchPokemonEvent {
  final Pokemon pokemon;

  OnCapturePokemon({required this.pokemon});
}

class OnGetCapturedPokemons extends SearchPokemonEvent {
  OnGetCapturedPokemons();
}
