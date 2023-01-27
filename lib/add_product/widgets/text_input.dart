import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput(this.label, this.size, this.controller, this.isNumber, {super.key});

  final String label;
  final int size;
  final TextEditingController controller;
  final bool isNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        maxLines: size,
      ),
    );
  }
}
