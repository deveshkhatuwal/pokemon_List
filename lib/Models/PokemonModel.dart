// lib/models/pokemon.dart
class Pokemon {
  final String name;
  final String imageUrl;
  final int height;
  final int weight;
  final List<String> types;

  Pokemon({
    required this.name,
    required this.imageUrl,
    required this.height,
    required this.weight,
    required this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      imageUrl: json['sprites']['front_default'],
      height: json['height'],
      weight: json['weight'],
      types: (json['types'] as List<dynamic>)
          .map((typeInfo) => typeInfo['type']['name'] as String)
          .toList(),
    );
  }
}
