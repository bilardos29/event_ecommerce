import 'package:event/utils/colors.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    required this.text,
    required this.onClick,
    this.disable = false,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback onClick;
  final bool disable;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!disable) {
          onClick();
        }
      },
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: disable ? Colors.grey : ColorsUtil.mainButton),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: ColorsUtil.secondaryText,
          ),
        ),
      ),
    );
  }
}
