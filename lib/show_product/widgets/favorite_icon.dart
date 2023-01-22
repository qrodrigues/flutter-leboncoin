import 'package:flutter/material.dart';
import 'package:leboncoin/firebase/add_product.dart';
import 'package:leboncoin/show_product/widgets/product_card.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon(this.productCard, {super.key});

  final ProductCard productCard;

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  _FavoriteIconState();

  Color _iconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    if (widget.productCard.product.favorite) {
      _iconColor = Colors.yellow.shade700;
    }

    return IconButton(
      color: _iconColor,
      icon: const Icon(Icons.star),
      onPressed: () {
        setState(() {
          if (!widget.productCard.product.favorite) {
            _iconColor = Colors.yellow.shade700;
            FirebaseProduct()
                .updateProductFavoriteField(widget.productCard.product);
            widget.productCard.product.favorite = true;
          } else {
            _iconColor = Colors.black;
            FirebaseProduct()
                .updateProductFavoriteField(widget.productCard.product);
            widget.productCard.product.favorite = false;
          }
        });
      },
    );
  }
}
