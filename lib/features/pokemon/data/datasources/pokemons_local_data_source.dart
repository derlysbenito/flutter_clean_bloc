import 'package:clean_architecture_bloc_app/core/error/failures.dart';
import 'package:clean_architecture_bloc_app/features/pokemon/data/models/pokemon_model.dart';
import 'package:clean_architecture_bloc_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class PokemonsLocalDataSource {
  Future<bool> capturePokemon(Pokemon pokemon);
  Future<List<PokemonModel>> getCapturedsPokemonList();
}

class HivePokemonsLocalDataSourceImpl implements PokemonsLocalDataSource {
  // constructor
  HivePokemonsLocalDataSourceImpl() {
    Hive.initFlutter();
  }

  @override
  Future<bool> capturePokemon(Pokemon pokemon) async {
    try {
      Box<dynamic> box = await Hive.openBox('pokemons');
      box.put(pokemon.id, PokemonModel.fromEntity(pokemon).toJson());
      return true;
    } catch (error) {
      debugPrint(error.toString());
      throw LocalFailure();
    }
  }

  @override
  Future<List<PokemonModel>> getCapturedsPokemonList() async {
    try {
      Box<dynamic> box = await Hive.openBox('pokemons');
      return box.values.map((p) => PokemonModel.fromJson(p)).toList();
    } catch (error) {
      debugPrint(error.toString());
      throw LocalFailure();
    }
  }
}
