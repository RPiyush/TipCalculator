import 'package:flutter/material.dart';

class PersonCounter extends StatelessWidget {
  const PersonCounter({
    super.key,
    required this.theme,
    required this.style,
    required this.billAmount,
  });

  final ThemeData theme;
  final TextStyle? style;
  final double billAmount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: theme.colorScheme.inversePrimary,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Text("Total Per Person", style: style),
            Text(
              "\$${billAmount.toStringAsFixed(2)}",
              style: style?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontSize: theme.textTheme.displaySmall?.fontSize),
            ),
          ],
        ),
      ),
    );
  }
}
