import 'package:flutter/material.dart';

class InputBillTextField extends StatelessWidget {
  const InputBillTextField({
    super.key,
    required this.onValueChange,
    required this.billAmount,
  });

  final String billAmount;
  final ValueChanged<String> onValueChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Bill Amount",
        prefixIcon: Icon(Icons.attach_money),
      ),
      keyboardType: TextInputType.number,
      onChanged: (String value) => {onValueChange(value)},
    );
  }
}
