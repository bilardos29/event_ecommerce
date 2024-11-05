import 'package:event/utils/colors.dart';
import 'package:flutter/material.dart';

class TextButtons extends StatelessWidget {
  final String text;
  final double size;
  final VoidCallback onClick;

  const TextButtons(this.text,
      {this.size = 12, required this.onClick, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          color: ColorsUtil.mainButton,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
