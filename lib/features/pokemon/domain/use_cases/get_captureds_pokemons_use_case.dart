import 'package:clean_architecture_bloc_app/core/error/failures.dart';
import 'package:clean_architecture_bloc_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:clean_architecture_bloc_app/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:dartz/dartz.dart';

class GetCapturedsPokemonsUseCase {
  final PokemonsRepository repository;

  GetCapturedsPokemonsUseCase({required this.repository});

  Future<Either<Failure, List<Pokemon>>> call() {
    return repository.getCapturedPokemons();
  }
}
