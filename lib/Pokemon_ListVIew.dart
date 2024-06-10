// lib/screens/pokemon_list_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'Pokemon_detailPage.dart';
import 'Provider/PokemonProvider.dart';


class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text('Pokemon List', style: GoogleFonts.abel(fontWeight: FontWeight.w600, fontSize: 25),),
      ),
      body: FutureBuilder(
        future: Provider.of<PokemonProvider>(context, listen: false).fetchPokemon(),
        builder: (ctx, snapshot) {
          return Consumer<PokemonProvider>(
            builder: (ctx, pokemonProvider, child) {
              if (pokemonProvider.isFetching) {
                return const Center(child: CircularProgressIndicator());
              } else if (pokemonProvider.errorMessage.isNotEmpty) {
                return Center(child: Text('Error: ${pokemonProvider.errorMessage}'));
              } else {
                return ListView.builder(
                  itemCount: pokemonProvider.pokemonList.length,
                  itemBuilder: (ctx, index) {
                    final pokemon = pokemonProvider.pokemonList[index];
                    return Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ListTile(

                        leading: Hero(tag: pokemon.imageUrl,
                            child: Image.network(pokemon.imageUrl, height: 80, width: 80,fit: BoxFit.cover,)),
                        title: Text(pokemon.name,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PokemonDetailScreen(pokemon: pokemon),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
