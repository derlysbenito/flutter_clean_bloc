import 'package:clean_architecture_bloc_app/core/error/failures.dart';
import 'package:clean_architecture_bloc_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:clean_architecture_bloc_app/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:dartz/dartz.dart';

class CapturePokemonUseCase {
  final PokemonsRepository repository;

  CapturePokemonUseCase({required this.repository});

  // Si una clase tiene un método llamado call(), eso permite que puedas usar
  // la clase como si fuera una función.
  Future<Either<Failure, bool>> call(Pokemon pokemon) {
    return repository.capturePokemon(pokemon);
  }
}
