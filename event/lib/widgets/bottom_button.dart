import 'package:event/widgets/main_button.dart';
import 'package:event/widgets/secondary_button.dart';
import 'package:flutter/material.dart';

enum BottomEnum { main, secondary }

class BottomButton extends StatelessWidget {
  BottomButton({
    required this.text,
    required this.onClick,
    this.bottomEnum = BottomEnum.main,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback onClick;
  BottomEnum? bottomEnum;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          bottomEnum == BottomEnum.main
              ? MainButton(text: text, onClick: onClick)
              : SecondaryButton(text: text, onClick: onClick),
        ],
      ),
    );
  }
}
