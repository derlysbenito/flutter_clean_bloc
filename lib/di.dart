import 'package:clean_architecture_bloc_app/features/pokemon/data/datasources/pokemons_local_data_source.dart';
import 'package:clean_architecture_bloc_app/features/pokemon/data/datasources/pokemons_remote_data_source.dart';
import 'package:clean_architecture_bloc_app/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:clean_architecture_bloc_app/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:clean_architecture_bloc_app/features/pokemon/domain/use_cases/capture_pokemon_use_case.dart';
import 'package:clean_architecture_bloc_app/features/pokemon/domain/use_cases/get_captureds_pokemons_use_case.dart';
import 'package:clean_architecture_bloc_app/features/pokemon/domain/use_cases/search_pokemon_use_case.dart';
import 'package:clean_architecture_bloc_app/features/pokemon/presentation/bloc/search_pokemon_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => SearchPokemonBloc(sl(), sl(), sl()));

  // Use cases
  sl.registerLazySingleton(() => CapturePokemonUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetCapturedsPokemonsUseCase(repository: sl()));
  sl.registerLazySingleton(() => SearchPokemonUseCase(repository: sl()));

  // Repositories
  sl.registerLazySingleton<PokemonsRepository>(
    () => PokemonRepositoryImpl(
      pokemonsLocalDataSource: sl(),
      pokemonsRemoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<PokemonsLocalDataSource>(
    () => HivePokemonsLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<PokemonsRemoteDataSource>(
    () => PokemonsRemoteDataSourceImpl(),
  );
}
