import 'package:flutter/material.dart';

class IconsButton extends StatelessWidget {
  const IconsButton({
    required this.icon,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  final String icon;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Image.asset('images/assets/$icon', width: 24,
          height: 24,
        ),
      ),
    );
  }
}
