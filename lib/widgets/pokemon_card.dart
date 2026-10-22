import 'package:flutter/material.dart';
import 'package:flutter_apps/models/pokemon.dart';
import 'package:flutter_apps/pages/detail_page.dart';
import 'package:flutter_apps/widgets/pokemon_list.dart';
import 'package:flutter_apps/widgets/type_chip.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;

  const PokemonCard({
    super.key,
    required this.pokemon,
    required this.onTap,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: pokemon.name,
                  child: Image.asset(
                    pokemon.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    onPressed: () {},
                    child: IconButton(
                      onPressed: onFavoriteTap,
                      icon: isFavorite
                          ? Icon(Icons.favorite, color: Colors.red[600])
                          : Icon(Icons.favorite, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: Text(pokemon.name)),
                  TypeChip(pokemon: pokemon, type: pokemon.type),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
