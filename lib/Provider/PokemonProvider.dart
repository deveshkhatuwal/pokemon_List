// lib/providers/pokemon_provider.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/PokemonModel.dart';


class PokemonProvider with ChangeNotifier {
  List<Pokemon> _pokemonList = [];
  String _errorMessage = '';
  bool _isFetching = false;

  List<Pokemon> get pokemonList => _pokemonList;
  String get errorMessage => _errorMessage;
  bool get isFetching => _isFetching;

  Future<void> fetchPokemon() async {
    final url = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=10');
    try {
      _isFetching = true;
      _errorMessage = '';
      notifyListeners();

      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception('Failed to load data');
      }

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<dynamic> results = extractedData['results'];

      _pokemonList = [];
      for (var result in results) {
        final detailUrl = result['url'];
        final detailResponse = await http.get(Uri.parse(detailUrl));
        if (detailResponse.statusCode != 200) {
          throw Exception('Failed to load details');
        }
        final detailData = json.decode(detailResponse.body);
        _pokemonList.add(Pokemon.fromJson(detailData));
      }
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }
}
