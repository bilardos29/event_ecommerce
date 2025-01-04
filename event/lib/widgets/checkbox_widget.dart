import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget(
      {required this.text, required this.val, required this.onChange, Key? key})
      : super(key: key);

  final String text;
  final bool val;
  final ValueChanged<bool> onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: val,
          onChanged: (val) {
            onChange(val!);
          },
        ),
        Text(text, style: const TextStyle(fontSize: 13))
      ],
    );
  }
}