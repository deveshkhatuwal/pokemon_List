// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pokemon_ListVIew.dart';
import 'Provider/PokemonProvider.dart';

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
        home: PokemonListScreen(),
      ),
    );
  }
}
