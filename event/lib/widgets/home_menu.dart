import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({required this.image, required this.onClick, Key? key})
      : super(key: key);

  final String? image;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: SizedBox(
        height: 100,
        width: 56,
        child: Column(
          children: [
            Image.asset(
              'images/$image',
              width: 56,
              height: 56,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 2),
            Text(
              'Service Name',
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
