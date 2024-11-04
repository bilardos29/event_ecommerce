import 'package:flutter/material.dart';

enum LogoEnum { small, big }

class LogoMenu extends StatelessWidget {
  const LogoMenu({this.logoEnum = LogoEnum.big, Key? key}) : super(key: key);

  final LogoEnum logoEnum;

  @override
  Widget build(BuildContext context) {
    bool isBigLogo = logoEnum == LogoEnum.big;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/assets/ic_logo.png',
          width: isBigLogo ? 34 : 22,
          height: isBigLogo ? 34 : 22,
        ),
        SizedBox(width: isBigLogo ? 6 : 3),
        Text(
          'SIMS PPOB',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: isBigLogo ? 24 : 14,
          ),
        ),
      ],
    );
  }
}
