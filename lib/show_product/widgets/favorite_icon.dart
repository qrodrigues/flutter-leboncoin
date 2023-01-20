import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({super.key});

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  Color _iconColor = Colors.black;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: _iconColor,
      icon: const Icon(Icons.star),
      onPressed: () {
        setState(() {
          if (!isChecked) {
            _iconColor = Colors.yellow.shade700;
            isChecked = true;
          } else {
            _iconColor = Colors.black;
            isChecked = false;
          }
        });
      },
    );
  }
}
