import 'package:event/utils/colors.dart';
import 'package:flutter/material.dart';

class TextButtons extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  const TextButtons(this.text, {required this.onClick, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, color: ColorsUtil.mainButton),
      ),
    );
  }
}
