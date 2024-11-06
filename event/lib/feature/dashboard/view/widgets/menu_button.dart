import 'package:event/utils/colors.dart';
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
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 120,
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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Image.asset(
            'images/assets/$image',
            width: 52,
            height: 52,
            color: Colors.black87,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
          ),
        ]),
      ),
    );
  }
}
