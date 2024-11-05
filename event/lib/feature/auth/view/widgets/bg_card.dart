import 'package:event/utils/colors.dart';
import 'package:flutter/material.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height / 2.7;
    return Column(
      children: [
        Container(
          height: size,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 1],
                colors: [
                  ColorsUtil.primaryBg,
                  ColorsUtil.secondaryBg,
                ],
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(100, 15),
                  bottomRight: Radius.elliptical(100, 15))),
        ),
      ],
    );
  }
}
