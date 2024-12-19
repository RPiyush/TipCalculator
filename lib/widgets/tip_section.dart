import 'package:flutter/material.dart';

class TipSection extends StatelessWidget {
  const TipSection({
    super.key,
    required this.theme,
    required this.tipValue,
  });

  final ThemeData theme;
  final double tipValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total Tip",
            style: theme.textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "\$$tipValue",
              style: theme.textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
