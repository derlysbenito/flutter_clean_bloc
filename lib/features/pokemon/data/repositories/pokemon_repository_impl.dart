import 'package:clean_architecture_bloc_app/core/error/failures.dart';
import 'package:clean_architecture_bloc_app/features/pokemon/data/datasources/pokemons_local_data_source.dart';
import 'package:clean_architecture_bloc_app/features/pokemon/data/datasources/pokemons_remote_data_source.dart';
import 'package:clean_architecture_bloc_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:clean_architecture_bloc_app/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PokemonRepositoryImpl implements PokemonsRepository {
  final PokemonsLocalDataSource pokemonsLocalDataSource;
  final PokemonsRemoteDataSource pokemonsRemoteDataSource;

  PokemonRepositoryImpl({
    required this.pokemonsLocalDataSource,
    required this.pokemonsRemoteDataSource,
  });

  @override
  Future<Either<Failure, bool>> capturePokemon(Pokemon pokemon) async {
    // Captura solo errores del tipo LocalFailure con ayuda de "on", si no es
    // LocalFailure no capturara nada

    try {
      final bool resp = await pokemonsLocalDataSource.capturePokemon(pokemon);
      return Right(resp);
    } on LocalFailure {
      return left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<Pokemon>>> getCapturedPokemons() async {
    try {
      final List<Pokemon> resp = await pokemonsLocalDataSource
          .getCapturedsPokemonList();
      return Right(resp);
    } on LocalFailure {
      return left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, Pokemon>> getPokemon(int id) async {
    try {
      final Pokemon resp = await pokemonsRemoteDataSource.getPokemon(id);
      return Right(resp);
    } on DioException {
      return left(ServerFailure());
    }
  }
}
