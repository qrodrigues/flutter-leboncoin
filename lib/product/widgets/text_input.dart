import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput(this.label, this.controller, {super.key});

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: const OutlineInputBorder(), labelText: label),
      ),
    );
  }
}
