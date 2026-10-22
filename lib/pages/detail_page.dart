import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/models/pokemon.dart';
import 'package:flutter_apps/widgets/type_chip.dart';

class DetailPage extends StatefulWidget {
  final Pokemon pokemon;
  final bool isFavorite;

  const DetailPage({
    super.key,
    required this.pokemon,
    required this.isFavorite,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pokemon.name,
          style: TextStyle(
            fontFamily: 'PokemonSolid',
            fontSize: 30,
            color: Colors.amber[600],
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite, color: Colors.red[600]),
          ),
          SizedBox(width: 12),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 768) {
            return Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Hero(
                      tag: widget.pokemon.name,
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(40),
                        child: Image.asset(
                          widget.pokemon.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 50,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.pokemon.name,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 15),
                          TypeChip(
                            pokemon: widget.pokemon,
                            type: widget.pokemon.type,
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Base Power: ${widget.pokemon.basePower}',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Deskripsi',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            widget.pokemon.description,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Skill',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Wrap(
                            children: widget.pokemon.skills
                                .map(
                                  (e) => Container(
                                    width: 140,
                                    padding: EdgeInsets.all(4),
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        width: 0.1,
                                        color: Colors.black,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 16,
                                          color: Colors.amber[600],
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          e,
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          // slider movies
                          CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                            ),
                            items: widget.pokemon.movies.map((url) {
                              return Image.network(
                                url,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 14.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(widget.pokemon.image),
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(
                      start: 14,
                      end: 14,
                      top: 20,
                      bottom: 14,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.0,
                      vertical: 12,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.pokemon.name,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 15),
                        TypeChip(
                          pokemon: widget.pokemon,
                          type: widget.pokemon.type,
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Base Power: ${widget.pokemon.basePower}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Deskripsi',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          widget.pokemon.description,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Skill',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Wrap(
                          children: widget.pokemon.skills
                              .map(
                                (e) => Container(
                                  width: 140,
                                  padding: EdgeInsets.all(4),
                                  margin: EdgeInsets.symmetric(vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      width: 0.1,
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Colors.amber[600],
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        e,
                                        style: TextStyle(fontFamily: 'Poppins'),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        SizedBox(height: 10),
                        CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                          ),
                          items: widget.pokemon.movies.map((url) {
                            return Image.network(
                              url,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
