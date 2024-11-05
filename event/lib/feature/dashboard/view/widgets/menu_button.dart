import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    required this.title,
    required this.image,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  final String image;
  final String title;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84,
      height: 94,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(children: [
        Image.asset(
          'images/assets/$image',
          width: 50,
          height: 50,
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ]),
    );
  }
}
