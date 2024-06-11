import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/pokemon.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Hero(
                  tag: pokemon.imageUrl,
                  child: Card(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      )),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          child: Image.network(
                            pokemon.imageUrl,
                            height: 150,
                            width: MediaQuery.of(context).size.width * 0.8,
                          )))),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                    child: Text(pokemon.name,
                        style: GoogleFonts.abel(
                            fontWeight: FontWeight.w600, fontSize: 35)),
                  ),
                  const SizedBox(height: 20),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _infowidget("Age", pokemon.height),
                        _verticalDivider(),
                        _infowidget("Weight", "${pokemon.weight} Kg"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Divider(
            //   thickness: 1,
            //   height: 20,
            // ),
            _infowidget("Type", pokemon.types.join(', ')),
          ],
        ),
      ),
    );
  }

  _verticalDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: VerticalDivider(
        width: 1,
        color: Colors.black45,
        thickness: 1,
      ),
    );
  }

  _infowidget(
    String datatag,
    dynamic data,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      child: Column(
        children: [
          Text("$data",
              style:
                  GoogleFonts.abel(fontWeight: FontWeight.w700, fontSize: 27)),
          Text(datatag,
              style:
                  const TextStyle(fontWeight: FontWeight.w300, fontSize: 14)),
        ],
      ),
    );
  }
}
