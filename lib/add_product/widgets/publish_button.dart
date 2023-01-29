import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PublishButton extends StatelessWidget {
  const PublishButton(this.onPressed, {super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xfffee9e1),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            AppLocalizations.of(context)!.publish,
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.check,
            size: 24,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
