import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const TipSlider({
    super.key,
    required double tipPercent,
    required this.onValueChanged,
  }) : _tipPercent = tipPercent;

  final double _tipPercent;
  final ValueChanged<double> onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Slider(
        value: _tipPercent,
        min: 0,
        max: 0.5,
        divisions: 5,
        label: "${(_tipPercent * 100).round()}%",
        onChanged: onValueChanged);
  }
}
