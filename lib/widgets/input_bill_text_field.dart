import 'package:flutter/material.dart';

class InputBillTextField extends StatelessWidget {
  const InputBillTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Bill Amount 1",
        prefixIcon: Icon(Icons.attach_money),
      ),
      keyboardType: TextInputType.number,
      onChanged: null,
    );
  }
}
