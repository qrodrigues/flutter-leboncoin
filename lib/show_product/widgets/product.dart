import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product(this.titre, this.prix, this.description, {super.key});

  final String titre;
  final double prix;
  final String description;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(titre),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                prix.toString(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
