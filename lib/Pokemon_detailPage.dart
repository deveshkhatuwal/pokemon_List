// lib/screens/pokemon_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Models/PokemonModel.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(pokemon.name,
            style: GoogleFonts.abel(fontWeight: FontWeight.w600, fontSize: 28)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                  tag: pokemon.imageUrl,
                  child: Card(
                      elevation: 2,
                      child: Image.network(pokemon.imageUrl, height: 200))),
            ),
            const SizedBox(height: 20),
            Text('Name: ${pokemon.name}',
                style: GoogleFonts.abel(
                    fontWeight: FontWeight.w600, fontSize: 22)),
            const SizedBox(height: 10),
            Text('Height: ${pokemon.height}',
                style: GoogleFonts.abel(
                    fontWeight: FontWeight.w600, fontSize: 22)),
            const SizedBox(height: 10),
            Text('Weight: ${pokemon.weight}',
                style: GoogleFonts.abel(
                    fontWeight: FontWeight.w600, fontSize: 22)),
            const SizedBox(height: 10),
            Text('Types: ${pokemon.types.join(', ')}',
                style: GoogleFonts.abel(
                    fontWeight: FontWeight.w600, fontSize: 22)),
          ],
        ),
      ),
    );
  }
}
