import 'package:flutter/material.dart';

class PublishButton extends StatelessWidget {
  const PublishButton(this.onPressed, {super.key});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {
          onPressed();
        },
        icon: const Icon(
          Icons.check,
          size: 24.0,
        ),
        label: const Text('Publier'));
  }
}
