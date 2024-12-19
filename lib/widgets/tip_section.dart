import 'package:flutter/material.dart';

class TipSection extends StatelessWidget {
  const TipSection({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Tip",
            style: theme.textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "\$20",
              style: theme.textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
