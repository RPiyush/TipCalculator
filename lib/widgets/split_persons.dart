import 'package:flutter/material.dart';

class SplitPersons extends StatelessWidget {
  const SplitPersons({
    super.key,
    required this.theme,
    required int numberOfPerson,
    required this.onDecrement,
    required this.onIncrement,
  }) : _numberOfPerson = numberOfPerson;

  final ThemeData theme;
  final int _numberOfPerson;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Split",
            style: theme.textTheme.titleMedium,
          ),
          Row(
            children: [
              IconButton(
                  color: theme.colorScheme.primary,
                  onPressed: onDecrement,
                  icon: const Icon(Icons.remove)),
              Text(
                "$_numberOfPerson",
                style: theme.textTheme.titleMedium,
              ),
              IconButton(
                  color: theme.colorScheme.primary,
                  onPressed: onIncrement,
                  icon: const Icon(Icons.add))
            ],
          )
        ],
      ),
    );
  }
}
