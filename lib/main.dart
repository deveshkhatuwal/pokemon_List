import 'package:flutter/material.dart';
import 'package:pokemon/providers/pokemon_provider.dart';
import 'package:pokemon/screens/pokemon_list_screen.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokemonProvider(),
      child: MaterialApp(
        title: 'Pokemon List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PokemonListScreen(),
      ),
    );
  }
}
