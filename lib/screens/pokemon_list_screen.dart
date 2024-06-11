import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon/widget/item_card.dart';
import 'package:provider/provider.dart';
import 'pokemon_detail_screen.dart';
import 'package:pokemon/providers/pokemon_provider.dart';

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Pokemon List',
          style: GoogleFonts.abel(fontWeight: FontWeight.w600, fontSize: 25),
        ),
      ),
      body: FutureBuilder(
        future:
            Provider.of<PokemonProvider>(context, listen: false).fetchPokemon(),
        builder: (ctx, snapshot) {
          return Consumer<PokemonProvider>(
            builder: (ctx, pokemonProvider, child) {
              if (pokemonProvider.isFetching) {
                return const Center(child: CircularProgressIndicator());
              } else if (pokemonProvider.errorMessage.isNotEmpty) {
                return Center(
                    child: Text('Error: ${pokemonProvider.errorMessage}'));
              } else {
                return ListView.builder(
                  itemCount: pokemonProvider.pokemonList.length,
                  itemBuilder: (ctx, index) {
                    final pokemon = pokemonProvider.pokemonList[index];
                    return itemCard(
                      imageUrl: pokemon.imageUrl,
                      subtitle: pokemon.types.join(" - ", ),
                       name: pokemon.name,
                      onitemtap:  PokemonDetailScreen(pokemon: pokemon),
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
