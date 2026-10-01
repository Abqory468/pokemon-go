import 'package:flutter/material.dart';
import 'package:flutter_apps/models/pokemon.dart';

class TypeChip extends StatelessWidget {
  final Pokemon pokemon;
  final String type;
  const TypeChip({super.key, required this.pokemon, required this.type});

  Color typeColor() {
  if (type.contains('Water')) {return Colors.blue;}
  if (type.contains('Poison')) {return Colors.purple;}
  if (type.contains('Grass')) {return Colors.green;}
  if (type.contains('Electric')) {return Colors.amber;}
  if (type.contains('Dragon')) {return Colors.indigo;}
  if (type.contains('Fire')) {return Colors.red;}
  if (type.contains('Ice')) {return Colors.teal;}
  if (type.contains('Ghost')) {return Colors.black12;}
  if (type.contains('Fairy')) {return Colors.pink;}
  if (type.contains('Normal')) {return Colors.grey;}
  if (type.contains('Fighting')) {return Colors.orange;}
  return Colors.amber;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: typeColor().withOpacity(0.15),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: typeColor(), width: 1),
      ),
      child: Text(pokemon.type),
    );
  }
}