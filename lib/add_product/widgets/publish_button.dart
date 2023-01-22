import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PublishButton extends StatelessWidget {
  const PublishButton(this.onPressed, {super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(
        Icons.check,
        size: 24,
      ),
      label: Text(AppLocalizations.of(context)!.publish),
    );
  }
}
